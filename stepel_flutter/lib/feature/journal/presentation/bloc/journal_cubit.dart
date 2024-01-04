import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stepel_flutter/core/domain/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/feature/journal/presentation/bloc/journal_state.dart';

class JournalCubit extends Cubit<JournalState> {
  final IFitDataRepository fitDataRepository;
  final IProfileDataRepository profileDataRepository;

  JournalCubit({
    required this.fitDataRepository,
    required this.profileDataRepository,
  }) : super(const JournalState.idle(data: []));

  void loadData() async {
    emit(const JournalState.processing(data: []));
    var result = await fitDataRepository.getAllFitData();
    emit(JournalState.successful(data: result));
  }

  Future<int> getStepsGoalByDate(DateTime date) async => await profileDataRepository.getStepsGoal(date);
}
