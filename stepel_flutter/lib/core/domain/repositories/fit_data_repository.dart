import 'package:stepel_flutter/core/domain/entites/fit_data_entity.dart';

abstract class IFitDataRepository {
  Stream<FitDataEntity> get fitDataStream;
  Future<FitDataEntity> getFitData(DateTime date);
  Future<List<FitDataEntity>> getWeeklyFitData();
  Future<List<FitDataEntity>> getAllFitData();
}
