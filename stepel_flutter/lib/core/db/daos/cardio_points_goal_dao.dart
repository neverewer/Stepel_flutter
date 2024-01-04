import 'package:drift/drift.dart';
import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/db/tables/cardio_points_goal.dart';

part 'cardio_points_goal_dao.g.dart';

@DriftAccessor(tables: [CardioPointsGoal])
class CardioPointsGoalDao extends DatabaseAccessor<AppDb> with _$CardioPointsGoalDaoMixin {
  CardioPointsGoalDao(db) : super(db);

  Future<void> createOrUpdateCardioPointsGoal(CardioPointsGoalData goal) async =>
      into(cardioPointsGoal).insertOnConflictUpdate(goal);

  Future<CardioPointsGoalData?> getCardioPointsGoalByDate(DateTime date) {
    return (select(cardioPointsGoal)..where((tbl) => tbl.date.isSmallerOrEqualValue(date))).getSingleOrNull();
  }
}
