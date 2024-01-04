import 'dart:async';

import 'package:stepel_flutter/core/domain/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/models/profile_data_update_event.dart';
import 'package:stepel_flutter/core/utils/date_time_utils.dart';
import 'package:stepel_flutter/feature/home/presentation/bloc/home_state.dart';
import 'package:stepel_flutter/imports.dart';

class HomeCubit extends Cubit<HomeState> {
  final IFitDataRepository fitDataRepo;
  final IProfileDataRepository profileDataRepo;
  late StreamSubscription _fitDataUpdateSubscription;
  late StreamSubscription _profileDataSubscription;

  HomeCubit({
    required this.fitDataRepo,
    required this.profileDataRepo,
  }) : super(const HomeState.idle());

  void init() async {
    getInitialData();
    initSubscriptions();
  }

  void initSubscriptions() {
    _fitDataUpdateSubscription = fitDataRepo.fitDataStream.listen((event) {
      emit((state as HomeState$Successful).copyWith(fitData: event));
    });

    _profileDataSubscription = profileDataRepo.profileDataUpdates.listen((event) {
      switch (event.updatedField) {
        case ProfileDataField.stepTarget:
          emit((state as HomeState$Successful).copyWith(stepsTarget: event.value.toInt()));
          break;
        case ProfileDataField.cardioPointsTarget:
          emit((state as HomeState$Successful).copyWith(cardioPointsTarget: event.value.toInt()));
          break;
        default:
          break;
      }
    });
  }

  void getInitialData() async {
    try {
      emit(const HomeState.processing());

      final currentDate = DateTimeUtils.getCurrentFormattedDate();

      var fitData = await fitDataRepo.getFitData(currentDate);

      var cardioPointsTarget = await profileDataRepo.getCardioPointsGoal(currentDate);
      var stepTarget = await profileDataRepo.getStepsGoal(currentDate);
      var weeklyFitData = await fitDataRepo.getWeeklyFitData();

      emit(HomeState.successful(
        fitData: fitData,
        cardioPointsTarget: cardioPointsTarget,
        stepsTarget: stepTarget,
        weeklyFitData: weeklyFitData,
      ));
    } catch (e) {
      emit(const HomeState.error());
    }
  }

  @override
  Future<void> close() {
    _fitDataUpdateSubscription.cancel();
    _profileDataSubscription.cancel();
    return super.close();
  }
}
