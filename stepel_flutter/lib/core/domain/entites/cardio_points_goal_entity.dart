import 'package:meta/meta.dart';

@immutable
final class CardioPointsGoalEntity {
  final DateTime date;
  final int goal;

  const CardioPointsGoalEntity({
    required this.date,
    required this.goal,
  });
}
