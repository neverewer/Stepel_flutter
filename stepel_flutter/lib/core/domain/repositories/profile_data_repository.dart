import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/models/profile_data_update_event.dart';

abstract class IProfileDataRepository {
  Future<int> getStepsGoal(DateTime date);
  void setStepsGoal(int stepsGoal);
  Future<int> getCardioPointsGoal(DateTime date);
  void setCardioPointsGoal(int cardioPointsGoal);
  Future<bool> getSleepingModeIsActive();
  void setSleepingModeIsActive(bool isActive);
  Future<TimeOfDay> getTimeToSleep();
  Future<TimeOfDay> getWakeUpTime();
  void setWakeUpTime(TimeOfDay wakeUpTime);
  void setTimeToSleep(TimeOfDay timeToSleep);
  Stream<ProfileDataUpdateEvent> get profileDataUpdates;
}
