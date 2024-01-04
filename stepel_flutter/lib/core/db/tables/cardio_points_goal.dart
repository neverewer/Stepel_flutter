import 'package:drift/drift.dart';

class CardioPointsGoal extends Table {
  DateTimeColumn get date => dateTime()();
  IntColumn get cardioPointsGoal => integer()();

  @override
  Set<Column> get primaryKey => {date};
}
