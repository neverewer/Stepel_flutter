import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:pedometer/pedometer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepel_flutter/core/db/daos/steps_dao.dart';
import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/dependencies/repositories/local_storage.dart';
import 'package:stepel_flutter/core/utils/date_time_utils.dart';

class PedometrServiceBackground {
  //service to show notifications

  static AndroidConfiguration androidConfiguration = AndroidConfiguration(
    onStart: onStart,
    autoStart: true, // automatically start background service after configure
    isForegroundMode: false,
    autoStartOnBoot: true, // automatically start service when device on boot
  );

  // initial Pedometr steps count
  // due to the fact that the pedometer gives the current number of steps, we need to remember the initial number of steps when we first start the application
  static int _initialSteps = 0;

  //function to initialize service in background
  static void init() async {
    //getAllSteps();
    final service = FlutterBackgroundService();
    if (await service.isRunning()) {
      return;
    }

    await service.configure(androidConfiguration: androidConfiguration, iosConfiguration: IosConfiguration());
  }

  // this function will be executed when app is in foreground or background in separated isolate
  @pragma('vm:entry-point')
  static Future<void> onStart(ServiceInstance service) async {
    DartPluginRegistrant.ensureInitialized();
    final localStorage = LocalStorage(sharedPreferences: await SharedPreferences.getInstance());
    final AppDb database = AppDb();
    final stepsDao = database.stepsDao;
    await getInitialSteps(localStorage);
    Pedometer.stepCountStream
        .listen((event) => onStepCount(event, service, localStorage, stepsDao))
        .onError(onStepCountError);
  }

  // function for counting steps
  static void onStepCount(StepCount event, ServiceInstance service, LocalStorage localStorage, StepsDao stepsDao) {
    setInitialSteps(event, localStorage);
    final currentDate = getCurrentSavedDate(localStorage);
    if (event.timeStamp.day == currentDate.day) {
      // if the current day coincides with the date the steps were received, then we save the current steps to database
      saveStepsToDatabase(event.steps, stepsDao);
    } else {
      // if the current day does not coincide with the date of receipt of the steps, we update current date and initial steps
      updateCurrentSavedDate(localStorage);
      updateInitialSteps(event.steps, localStorage);
      saveStepsToDatabase(event.steps, stepsDao);
    }
    service.invoke('updateSteps', {'steps': event.steps - _initialSteps});
  }

  // function to handle error while listening Pedometr.stepCountStream
  static void onStepCountError(error) => Error.throwWithStackTrace(error, StackTrace.current);

  //get initial steps from SharedPreferences
  static Future<void> getInitialSteps(LocalStorage localStorage) async {
    var initSteps = localStorage.getCurrentSteps();
    //if initial steps have not been saved in SharedPreferences, we exit the function
    if (initSteps == null) {
      return;
    }
    _initialSteps = initSteps;
  }

  // save initial steps count to SharedPreferences
  // it's need if we don't have saved inital steps count value
  static void setInitialSteps(StepCount event, LocalStorage localStorage) async {
    if (event.steps >= _initialSteps && _initialSteps != 0) {
      return;
    }

    _initialSteps = event.steps;
    localStorage.setCurrentSteps(_initialSteps);
  }

  //update previous steps and save value to SharedPreferences
  static void updateInitialSteps(int preSteps, LocalStorage localStorage) async {
    localStorage.setCurrentSteps(preSteps);
    _initialSteps = preSteps;
  }

  // update current date and save value to SharedPreferences
  static void updateCurrentSavedDate(LocalStorage localStorage) async {
    final currentDate = DateTimeUtils.getCurrentFormattedDate();
    localStorage.setStepDate(currentDate.toIso8601String());
  }

  static DateTime getCurrentSavedDate(LocalStorage localStorage) {
    final date = localStorage.getStepDate();
    return date == null ? DateTimeUtils.getCurrentFormattedDate() : DateTime.parse(date);
  }

  // save steps count to database
  static void saveStepsToDatabase(int steps, StepsDao stepsDao) async {
    final currentDate = DateTimeUtils.getCurrentFormattedDate();

    final newSteps = steps - _initialSteps;

    await stepsDao.createOrUpdateSteps(Step(date: currentDate, steps: newSteps));
  }
}
