import 'package:drift/drift.dart';
import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/db/tables/steps.dart';

part 'steps_dao.g.dart';

@DriftAccessor(tables: [Steps])
class StepsDao extends DatabaseAccessor<AppDb> with _$StepsDaoMixin {
  StepsDao(db) : super(db);

  Future<List<Step>> getWeeklySteps() async {
    final weekAgo = DateTime.now().subtract(const Duration(days: 7));
    return await (select(steps)..where((tbl) => tbl.date.isBiggerOrEqualValue(weekAgo))).get();
  }

  Future<void> createOrUpdateSteps(Step step) async => into(steps).insertOnConflictUpdate(step);

  SingleOrNullSelectable<Step> getStepsByDate(DateTime date) => (select(steps)..where((tbl) => tbl.date.equals(date)));

  Future<List<Step>> getAllSteps() async => await (select(steps).get());

}
