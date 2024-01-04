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
  int getStepsTarget() => _sharedPreferences.getInt('STEPSTARGET') ?? 8000;
  Future<void> setStepTarget(int stepsTarget) => _sharedPreferences.setInt('STEPSTARGET', stepsTarget);
  int getCardioPointsTarget() => _sharedPreferences.getInt('CARDIOPOINTSTARGET') ?? 40;
  Future<void> setCardioPointsTartget(int cardioPointsTarget) =>
      _sharedPreferences.setInt('CARDIOPOINTSTARGET', cardioPointsTarget);
  bool getSleepingModeActive() => _sharedPreferences.getBool('SLEEPINGMODEACTIVE') ?? false;
  Future<void> setSleepingModeActive(bool isActive) => _sharedPreferences.setBool('SLEEPINGMODEACTIVE', isActive);
  int getWakeUpTimeHours() => _sharedPreferences.getInt('WAKEUPTIMEHOURS') ?? 7;
  Future<void> setWakeUpTimeHours(int wakeUpTimeHours) => _sharedPreferences.setInt('WAKEUPTIMEHOURS', wakeUpTimeHours);
  int getWakeUpTimeMinutes() => _sharedPreferences.getInt('WAKEUPTIMEMINUTES') ?? 0;
  Future<void> setWakeUpTimeMinutes(int wakeUpTimeMinutes) =>
      _sharedPreferences.setInt('WAKEUPTIMEMINUTES', wakeUpTimeMinutes);
  int getTimeToSleepHours() => _sharedPreferences.getInt('TIMETOSLEEPHOURS') ?? 22;
  Future<void> setTimeToSleepHours(int timeToSleepHours) =>
      _sharedPreferences.setInt('TIMETOSLEEPHOURS', timeToSleepHours);
  int getTimeToSleepMinutes() => _sharedPreferences.getInt('TIMETOSLEEPMINUTES') ?? 0;
  Future<void> setTimeToSleepMinutes(int timeToSleepMinutes) =>
      _sharedPreferences.setInt('TIMETOSLEEPMINUTES', timeToSleepMinutes);
}




// mixin LocalStorageCache {
//   //init storage using Shared Preferences
//   late final Future<SharedPreferences> _$db = SharedPreferences.getInstance();
// }

// mixin LocalStorageApi on LocalStorageCache {
//   Future<void> setFirstAppRun(bool firstAppRun) => _$db.then((db) => db.setBool('FIRSTAPPRUN', firstAppRun));
//   Future<bool?> getFirstAppRun() => _$db.then((db) => db.getBool('FIRSTAPPRUN'));
//   Future<void> setCurrentSteps(int steps) => _$db.then((db) => db.setInt('CURRENTSTEPS', steps));
//   Future<int?> getCurrentSteps() => _$db.then((db) => db.getInt('CURRENTSTEPS'));
//   Future<void> setStepDate(String date) => _$db.then((db) => db.setString('STEPDATE', date));
//   Future<String?> getStepDate() => _$db.then((db) => db.getString('STEPDATE'));
//   Future<void> setPermissionsGranted(bool permissionsGranted) =>
//       _$db.then((db) => db.setBool('PERMISSIONSGRANTED', permissionsGranted));
//   Future<bool?> getPermissionsGranted() => _$db.then((db) => db.getBool('PERMISSIONSGRANTED'));
//   Future<int?> getStepsTarget() => _$db.then((db) => db.getInt('STEPSTARGET'));
//   Future<void> setStepTarget(int stepsTarget) => _$db.then((db) => db.setInt('STEPSTARGET', stepsTarget));
//   Future<int?> getCardioPointsTarget() => _$db.then((db) => db.getInt('CARDIOPOINTSTARGET'));
//   Future<void> setCardioPointsTartget(int cardioPointsTarget) =>
//       _$db.then((db) => db.setInt('CARDIOPOINTSTARGET', cardioPointsTarget));
//   Future<bool?> getSleepingModeActive() => _$db.then((db) => db.getBool('SLEEPINGMODEACTIVE'));
//   Future<void> setSleepingModeActive(bool isActive) => _$db.then((db) => db.setBool('SLEEPINGMODEACTIVE', isActive));
//   Future<int?> getWakeUpTimeHours() => _$db.then((db) => db.getInt('WAKEUPTIMEHOURS'));
//   Future<void> setWakeUpTimeHours(int wakeUpTimeHours) =>
//       _$db.then((db) => db.setInt('WAKEUPTIMEHOURS', wakeUpTimeHours));
//   Future<int?> getWakeUpTimeMinutes() => _$db.then((db) => db.getInt('WAKEUPTIMEMINUTES'));
//   Future<void> setWakeUpTimeMinutes(int wakeUpTimeMinutes) =>
//       _$db.then((db) => db.setInt('WAKEUPTIMEMINUTES', wakeUpTimeMinutes));
//   Future<int?> getTimeToSleepHours() => _$db.then((db) => db.getInt('TIMETOSLEEPHOURS'));
//   Future<void> setTimeToSleepHours(int timeToSleepHours) =>
//       _$db.then((db) => db.setInt('TIMETOSLEEPHOURS', timeToSleepHours));
//   Future<int?> getTimeToSleepMinutes() => _$db.then((db) => db.getInt('TIMETOSLEEPMINUTES'));
//   Future<void> setTimeToSleepMinutes(int timeToSleepMinutes) =>
//       _$db.then((db) => db.setInt('TIMETOSLEEPMINUTES', timeToSleepMinutes));
// }
