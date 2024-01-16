import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:stepel_flutter/core/db/daos/cardio_points_goal_dao.dart';
import 'package:stepel_flutter/core/db/daos/steps_goal_dao.dart';
import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/local_storage/local_storage.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/models/profile_data_update_event.dart';
import 'package:stepel_flutter/core/utils/date_time_utils.dart';

class ProfileDataRepositoryImpl extends IProfileDataRepository {
  final CardioPointsGoalDao cardioPointsGoalDao;
  final StepsGoalDao stepsGoalDao;
  final LocalStorage localStorage;
  final StreamController<ProfileDataUpdateEvent> _streamController = StreamController<ProfileDataUpdateEvent>();

  @override
  Stream<ProfileDataUpdateEvent> get profileDataUpdates => _streamController.stream;

  ProfileDataRepositoryImpl({
    required this.localStorage,
    required this.cardioPointsGoalDao,
    required this.stepsGoalDao,
  });

  @override
  Future<int> getStepsGoal(DateTime date) async {
    final stepsGoalData = await stepsGoalDao.getStepsGoalByDate(date);

    if (stepsGoalData == null) {
      return 8000;
    }

    return stepsGoalData.stepsGoal;
  }

  @override
  void setStepsGoal(int stepsGoal) async {
    stepsGoalDao
        .createOrUpdateStepsGoal(StepsGoalData(stepsGoal: stepsGoal, date: DateTimeUtils.getCurrentFormattedDate()));

    _streamController.add(ProfileDataUpdateEvent(value: stepsGoal, updatedField: ProfileDataField.stepTarget));
    FlutterBackgroundService().invoke("ChangeStepTarget", {'stepTarget': stepsGoal});
  }

  @override
  Future<int> getCardioPointsGoal(DateTime date) async {
    final cardioPointsGoalData = await cardioPointsGoalDao.getCardioPointsGoalByDate(date);

    if (cardioPointsGoalData == null) {
      return 40;
    }

    return cardioPointsGoalData.cardioPointsGoal;
  }

  @override
  void setCardioPointsGoal(int cardioPointsGoal) {
    cardioPointsGoalDao.createOrUpdateCardioPointsGoal(
        CardioPointsGoalData(date: DateTimeUtils.getCurrentFormattedDate(), cardioPointsGoal: cardioPointsGoal));

    _streamController
        .add(ProfileDataUpdateEvent(value: cardioPointsGoal, updatedField: ProfileDataField.cardioPointsTarget));
  }

  @override
  Future<bool> getSleepingModeIsActive() async => localStorage.getSleepingModeActive();

  @override
  void setSleepingModeIsActive(bool isActive) {
    localStorage.setSleepingModeActive(isActive);
  }

  @override
  Future<TimeOfDay> getWakeUpTime() async {
    var wakeUpTimeHours = localStorage.getWakeUpTimeHours() ?? 7;
    var wakeUpTimeMinutes = localStorage.getWakeUpTimeMinutes() ?? 0;
    return TimeOfDay(hour: wakeUpTimeHours, minute: wakeUpTimeMinutes);
  }

  @override
  void setWakeUpTime(TimeOfDay wakeUpTime) {
    localStorage.setWakeUpTimeHours(wakeUpTime.hour);
    localStorage.setWakeUpTimeMinutes(wakeUpTime.minute);
  }

  @override
  Future<TimeOfDay> getTimeToSleep() async {
    var timeToSleepHours = localStorage.getTimeToSleepHours() ?? 22;
    var timeToSleepMinutes = localStorage.getTimeToSleepMinutes() ?? 0;
    return TimeOfDay(hour: timeToSleepHours, minute: timeToSleepMinutes);
  }

  @override
  void setTimeToSleep(TimeOfDay timeToSleep) {
    localStorage.setTimeToSleepHours(timeToSleep.hour);
    localStorage.setTimeToSleepMinutes(timeToSleep.minute);
  }
}
