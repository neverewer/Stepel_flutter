import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/utils/date_time_utils.dart';
import 'package:stepel_flutter/feature/profile/presentation/bloc/profile_state.dart';
import 'package:stepel_flutter/imports.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final IProfileDataRepository profileDataRepo;

  ProfileCubit({
    required this.profileDataRepo,
  }) : super(const ProfileState.idle());

  Future<void> init() async {
    emit(const ProfileState.processing());
    final currentDate = DateTimeUtils.getCurrentFormattedDate();

    var stepsTarget = await profileDataRepo.getStepsGoal(currentDate);
    var cardioPointsTarget = await profileDataRepo.getCardioPointsGoal(currentDate);
    var isSleepingModeActive = await profileDataRepo.getSleepingModeIsActive();
    var wakeUpTime = await profileDataRepo.getWakeUpTime();
    var timeToSleep = await profileDataRepo.getTimeToSleep();
    emit(ProfileState.successful(
      stepsTarget: stepsTarget,
      cardioPointsTarget: cardioPointsTarget,
      isSleepingModeActive: isSleepingModeActive,
      wakeUpTime: wakeUpTime,
      timeToSleep: timeToSleep,
    ));
  }

  void setStepsTarget(int stepsGoal) {
    profileDataRepo.setStepsGoal(stepsGoal);
    emit((state as ProfileState$Successful).copyWith(stepsTarget: stepsGoal));
  }

  void setCardioPointsTarget(int cardioPointsGoal) {
    profileDataRepo.setCardioPointsGoal(cardioPointsGoal);
    emit((state as ProfileState$Successful).copyWith(cardioPointsTarget: cardioPointsGoal));
  }

  void activeDailySleepingModeNotifications(bool isActivate) {
    isActivate
        ? {
            NotificationService.activateWakeUpNotifications((state as ProfileState$Successful).wakeUpTime),
            NotificationService.activateTimeToSleepNotifications((state as ProfileState$Successful).timeToSleep),
          }
        : NotificationService.deactivateSleepingModeNotifications();
    profileDataRepo.setSleepingModeIsActive(isActivate);
    emit((state as ProfileState$Successful).copyWith(isSleepingModeActive: isActivate));
  }

  void setWakeUpTime(TimeOfDay wakeUpTime) {
    profileDataRepo.setWakeUpTime(wakeUpTime);
    NotificationService.activateWakeUpNotifications(wakeUpTime);
    emit((state as ProfileState$Successful).copyWith(wakeUpTime: wakeUpTime));
  }

  void setTimeToSleep(TimeOfDay timeToSleep) {
    profileDataRepo.setTimeToSleep(timeToSleep);
    NotificationService.activateTimeToSleepNotifications(timeToSleep);
    emit((state as ProfileState$Successful).copyWith(timeToSleep: timeToSleep));
  }
}
