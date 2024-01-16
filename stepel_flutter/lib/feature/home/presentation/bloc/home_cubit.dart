import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/core/domain/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/models/profile_data_update_event.dart';
import 'package:stepel_flutter/core/utils/date_time_utils.dart';
import 'package:stepel_flutter/feature/home/presentation/bloc/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final IFitDataRepository fitDataRepository;
  final IProfileDataRepository profileDataRepository;
  late StreamSubscription _fitDataUpdateSubscription;
  late StreamSubscription _profileDataSubscription;

  HomeCubit({
    required this.fitDataRepository,
    required this.profileDataRepository,
  }) : super(const HomeState.idle());

  void init() async {
    getInitialData();
    initSubscriptions();
  }

  void initSubscriptions() {
    _fitDataUpdateSubscription = fitDataRepository.fitDataStream.listen((event) {
      if (state is HomeState$Successful) {
        emit((state as HomeState$Successful).copyWith(fitData: event));
      }
    });

    _profileDataSubscription = profileDataRepository.profileDataUpdates.listen((event) {
      switch (event.updatedField) {
        case ProfileDataField.stepTarget:
          if (state is HomeState$Successful) {
            emit((state as HomeState$Successful).copyWith(stepsTarget: event.value.toInt()));
          }
          break;
        case ProfileDataField.cardioPointsTarget:
          if (state is HomeState$Successful) {
            emit((state as HomeState$Successful).copyWith(cardioPointsTarget: event.value.toInt()));
          }
          break;
      }
    });
  }

  void getInitialData() async {
    try {
      emit(const HomeState.processing());

      final currentDate = DateTimeUtils.getCurrentFormattedDate();

      var fitData = await fitDataRepository.getFitData(currentDate);

      var cardioPointsTarget = await profileDataRepository.getCardioPointsGoal(currentDate);
      var stepTarget = await profileDataRepository.getStepsGoal(currentDate);
      var weeklyFitData = await fitDataRepository.getWeeklyFitData();

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
