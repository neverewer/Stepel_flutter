import 'package:stepel_flutter/core/domain/entites/fit_data_entity.dart';

sealed class FitDataUtils {
  static List<FitDataEntity> completeWeaklyFitData(List<FitDataEntity> list) {
    for (int i = list.length; i < 7; i++) {
      list.insert(0, FitDataEntity(0));
    }
    return list;
  }
}
