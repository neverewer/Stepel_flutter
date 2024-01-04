import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:stepel_flutter/core/db/daos/steps_dao.dart';
import 'package:stepel_flutter/core/domain/entites/fit_data_entity.dart';
import 'package:stepel_flutter/core/domain/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/utils/fit_data_utils.dart';

class FitDataRepositoryImpl extends IFitDataRepository {
  final StepsDao stepsDao;

  FitDataRepositoryImpl({
    required this.stepsDao,
  });

  @override
  Stream<FitDataEntity> get fitDataStream =>
      FlutterBackgroundService().on('updateSteps').map((event) => FitDataEntity(event!['steps']));

  @override
  Future<FitDataEntity> getFitData(DateTime date) async {
    final result = stepsDao.getStepsByDate(date);

    final steps = await result.getSingleOrNull();

    if (steps == null) {
      return FitDataEntity.zero;
    }

    return FitDataEntity(steps.steps);
  }

  @override
  Future<List<FitDataEntity>> getWeeklyFitData() async {
    final result = await stepsDao.getWeeklySteps();

    var weeklyFitData = result.map((step) => FitDataEntity(step.steps)).toList();

    if (weeklyFitData.length < 7) {
      weeklyFitData = FitDataUtils.completeWeaklyFitData(weeklyFitData);
      return weeklyFitData;
    }

    return weeklyFitData;
  }

  @override
  Future<List<FitDataEntity>> getAllFitData() async {
    final result = await stepsDao.getAllSteps();

    final list = result.reversed.map((e) => FitDataEntity(e.steps, date: e.date)).toList();

    return list;
  }
}
