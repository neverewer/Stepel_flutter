import 'package:meta/meta.dart';

@immutable
final class StepsGoalEntity {
  final DateTime date;
  final int goal;

  const StepsGoalEntity({
    required this.date,
    required this.goal,
  });
}
