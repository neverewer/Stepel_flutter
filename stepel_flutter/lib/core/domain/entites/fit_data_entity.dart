import 'dart:io';

import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

@immutable
final class FitDataEntity implements Comparable<FitDataEntity> {
  FitDataEntity(this.steps, {this.date});

  static FitDataEntity zero = FitDataEntity(0);

  final int steps;

  final DateTime? date;

  late final double calories = steps * 0.04;

  late final int cardioPoints = steps ~/ 200;

  late final double moveDistance = steps * 0.0007;

  late final int moveMinutes = steps ~/ 100;

  FitDataEntity copyWith({
    int? newSteps,
  }) =>
      FitDataEntity(
        newSteps ?? steps,
      );

  String dateToString() {
    final formatter = DateFormat('EEEE, d MMMM', Platform.localeName);
    return formatter.format(date!);
  }

  @override
  int compareTo(FitDataEntity other) => steps.compareTo(other.steps);

  @override
  bool operator ==(Object other) => identical(this, other) || other is FitDataEntity && other.steps == steps;

  @override
  int get hashCode => steps;
}
