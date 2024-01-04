import 'package:drift/drift.dart';
import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/db/tables/steps_goal.dart';

part 'steps_goal_dao.g.dart';

@DriftAccessor(tables: [StepsGoal])
class StepsGoalDao extends DatabaseAccessor<AppDb> with _$StepsGoalDaoMixin {
  StepsGoalDao(db) : super(db);

  Future<void> createOrUpdateStepsGoal(StepsGoalData goal) async => into(stepsGoal).insertOnConflictUpdate(goal);

  Future<StepsGoalData?> getStepsGoalByDate(DateTime date) {
    return (select(stepsGoal)..where((tbl) => tbl.date.isSmallerOrEqualValue(date))).getSingleOrNull();
  }
}
