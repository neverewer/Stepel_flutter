import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences _sharedPreferences;

  LocalStorage({required SharedPreferences sharedPreferences}) : _sharedPreferences = sharedPreferences;

  Future<void> setIsFirstAppRun(bool isFirstAppRun) => _sharedPreferences.setBool('FIRSTAPPRUN', isFirstAppRun);
  bool getIsFirstAppRun() => _sharedPreferences.getBool('FIRSTAPPRUN') ?? true;
  Future<void> setIsPermissionsGranted(bool isPermissionsGranted) =>
      _sharedPreferences.setBool('PERMISSIONSGRANTED', isPermissionsGranted);
  bool getIsPermissionsGranted() => _sharedPreferences.getBool('PERMISSIONSGRANTED') ?? false;
  Future<void> setCurrentSteps(int steps) => _sharedPreferences.setInt('CURRENTSTEPS', steps);
  int? getCurrentSteps() => _sharedPreferences.getInt('CURRENTSTEPS');
  Future<void> setStepDate(String date) => _sharedPreferences.setString('STEPDATE', date);
  String? getStepDate() => _sharedPreferences.getString('STEPDATE');
  bool getSleepingModeActive() => _sharedPreferences.getBool('SLEEPINGMODEACTIVE') ?? false;
  Future<void> setSleepingModeActive(bool isActive) => _sharedPreferences.setBool('SLEEPINGMODEACTIVE', isActive);
  int? getWakeUpTimeHours() => _sharedPreferences.getInt('WAKEUPTIMEHOURS');
  Future<void> setWakeUpTimeHours(int wakeUpTimeHours) => _sharedPreferences.setInt('WAKEUPTIMEHOURS', wakeUpTimeHours);
  int? getWakeUpTimeMinutes() => _sharedPreferences.getInt('WAKEUPTIMEMINUTES');
  Future<void> setWakeUpTimeMinutes(int wakeUpTimeMinutes) =>
      _sharedPreferences.setInt('WAKEUPTIMEMINUTES', wakeUpTimeMinutes);
  int? getTimeToSleepHours() => _sharedPreferences.getInt('TIMETOSLEEPHOURS');
  Future<void> setTimeToSleepHours(int timeToSleepHours) =>
      _sharedPreferences.setInt('TIMETOSLEEPHOURS', timeToSleepHours);
  int? getTimeToSleepMinutes() => _sharedPreferences.getInt('TIMETOSLEEPMINUTES');
  Future<void> setTimeToSleepMinutes(int timeToSleepMinutes) =>
      _sharedPreferences.setInt('TIMETOSLEEPMINUTES', timeToSleepMinutes);
}

