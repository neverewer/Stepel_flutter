import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/notifications/notification_service.dart';
import 'package:stepel_flutter/core/utils/date_time_utils.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IProfileDataRepository profileDataRepository;

  ProfileCubit({
    required this.profileDataRepository,
  }) : super(const ProfileState.idle());

  Future<void> init() async {
    emit(const ProfileState.processing());
    final currentDate = DateTimeUtils.getCurrentFormattedDate();

    var stepsTarget = await profileDataRepository.getStepsGoal(currentDate);
    var cardioPointsTarget = await profileDataRepository.getCardioPointsGoal(currentDate);
    var isSleepingModeActive = await profileDataRepository.getSleepingModeIsActive();
    var wakeUpTime = await profileDataRepository.getWakeUpTime();
    var timeToSleep = await profileDataRepository.getTimeToSleep();
    emit(ProfileState.successful(
      stepsTarget: stepsTarget,
      cardioPointsTarget: cardioPointsTarget,
      isSleepingModeActive: isSleepingModeActive,
      wakeUpTime: wakeUpTime,
      timeToSleep: timeToSleep,
    ));
  }

  void setStepsTarget(int stepsGoal) {
    profileDataRepository.setStepsGoal(stepsGoal);
    emit((state as ProfileState$Successful).copyWith(stepsTarget: stepsGoal));
  }

  void setCardioPointsTarget(int cardioPointsGoal) {
    profileDataRepository.setCardioPointsGoal(cardioPointsGoal);
    emit((state as ProfileState$Successful).copyWith(cardioPointsTarget: cardioPointsGoal));
  }

  void activeDailySleepingModeNotifications(bool isActivate) {
    isActivate
        ? {
            NotificationService.activateWakeUpNotifications((state as ProfileState$Successful).wakeUpTime),
            NotificationService.activateTimeToSleepNotifications((state as ProfileState$Successful).timeToSleep),
          }
        : NotificationService.deactivateSleepingModeNotifications();
    profileDataRepository.setSleepingModeIsActive(isActivate);
    emit((state as ProfileState$Successful).copyWith(isSleepingModeActive: isActivate));
  }

  void setWakeUpTime(TimeOfDay wakeUpTime) {
    profileDataRepository.setWakeUpTime(wakeUpTime);
    NotificationService.activateWakeUpNotifications(wakeUpTime);
    emit((state as ProfileState$Successful).copyWith(wakeUpTime: wakeUpTime));
  }

  void setTimeToSleep(TimeOfDay timeToSleep) {
    profileDataRepository.setTimeToSleep(timeToSleep);
    NotificationService.activateTimeToSleepNotifications(timeToSleep);
    emit((state as ProfileState$Successful).copyWith(timeToSleep: timeToSleep));
  }
}
