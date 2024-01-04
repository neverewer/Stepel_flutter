import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/domain/entites/fit_data_entity.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/app/themes.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/category_label.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/chart_bottom_row.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/home_app_bar.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/trend_card.dart';
import 'package:stepel_flutter/feature/widgets/double_circle_chart.dart';
import 'package:stepel_flutter/feature/widgets/statistic_line.dart';

class HomeDataWidget extends StatelessWidget {
  final FitDataEntity fitData;
  final int stepsTarget;
  final int cardioPointsTarget;
  final List<FitDataEntity> weeklyFitData;

  const HomeDataWidget({
    super.key,
    required this.fitData,
    required this.stepsTarget,
    required this.cardioPointsTarget,
    required this.weeklyFitData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(right: 8, left: 8),
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 100),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HomeAppBar(),
              const SizedBox(height: 16),
              CircleDoubleChart(
                firstValue: fitData.steps.toDouble(),
                secondValue: fitData.cardioPoints.toDouble(),
                firstValueTarget: stepsTarget.toDouble(),
                secondValueTarget: cardioPointsTarget.toDouble(),
              ),
              const SizedBox(height: 16),
              const ChartBottomRow(),
              const SizedBox(height: 32),
              StatisticLine(
                calories: fitData.calories.toInt(),
                distance: fitData.moveDistance,
                moveTimeInMinutes: fitData.moveMinutes,
                axis: Axis.horizontal,
              ),
              const SizedBox(height: 32),
              CategoryLabel(text: context.localization.homePageTrendsLabel),
              const SizedBox(height: 2),
              TrendCard(
                topLabel: context.localization.homePageCardioPointsTrendLabel,
                value: fitData.cardioPoints,
                data: weeklyFitData.map((e) => e.cardioPoints.toDouble()).toList(),
                color: Themes.primaryTurquoiseColorLight,
                goal: cardioPointsTarget.toDouble(),
              ),
              TrendCard(
                topLabel: context.localization.homePageStepsTrendLabel,
                value: fitData.steps,
                data: weeklyFitData.map((e) => e.steps.toDouble()).toList(),
                goal: stepsTarget.toDouble(),
              ),
              TrendCard(
                topLabel: context.localization.homePageCaloriesTrendLabel,
                value: fitData.calories.toInt(),
                data: weeklyFitData.map((e) => e.calories).toList(),
                color: Themes.primaryBlueColorLight,
              ),
            ],
          ),
        ));
  }
}
