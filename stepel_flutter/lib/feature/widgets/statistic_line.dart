import 'package:stepel_flutter/imports.dart';

class StatisticLine extends StatelessWidget {
  final int calories;
  final double distance;
  final int moveTimeInMinutes;
  final Axis axis;

  const StatisticLine({
    super.key,
    required this.calories,
    required this.distance,
    required this.moveTimeInMinutes,
    required this.axis,
  });

  @override
  Widget build(BuildContext context) {
    return axis == Axis.horizontal
        ? SizedBox(
            width: Sizes.statisticLineWidht,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatisticBox(
                  value: calories.toString(),
                  label: context.localization.caloriesStatisticBoxText,
                ),
                StatisticBox(
                  value: distance.toStringAsFixed(1),
                  label: context.localization.distanceStatisticBoxText,
                ),
                StatisticBox(
                  value: moveTimeInMinutes.toString(),
                  label: context.localization.movingTimeStatisticBoxText,
                ),
              ],
            ),
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StatisticBox(
                value: calories.toString(),
                label: context.localization.caloriesStatisticBoxText,
              ),
              StatisticBox(
                value: distance.toStringAsFixed(1),
                label: context.localization.distanceStatisticBoxText,
              ),
              StatisticBox(
                value: moveTimeInMinutes.toString(),
                label: context.localization.movingTimeStatisticBoxText,
              ),
            ],
          );
  }
}
