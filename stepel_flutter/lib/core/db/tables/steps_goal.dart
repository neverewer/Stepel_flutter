import 'package:drift/drift.dart';

class StepsGoal extends Table {
  DateTimeColumn get date => dateTime()();
  IntColumn get stepsGoal => integer()();

  @override
  Set<Column> get primaryKey => {date};
}
