import 'package:stepel_flutter/feature/home/presentation/widgets/category_label.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/chart_bottom_row.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/home_app_bar.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/trend_card.dart';
import 'package:stepel_flutter/imports.dart';

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
        padding: Sizes.homePageContentPadding,
        child: SingleChildScrollView(
          padding: Sizes.homePageListBottomPadding,
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const HomeAppBar(),
              const SizedBox(height: Sizes.spacingFull),
              CircleDoubleChart(
                firstValue: fitData.steps.toDouble(),
                secondValue: fitData.cardioPoints.toDouble(),
                firstValueTarget: stepsTarget.toDouble(),
                secondValueTarget: cardioPointsTarget.toDouble(),
              ),
              const SizedBox(height: Sizes.spacingFull),
              const ChartBottomRow(),
              const SizedBox(height: Sizes.spacingLarge),
              StatisticLine(
                calories: fitData.calories.toInt(),
                distance: fitData.moveDistance,
                moveTimeInMinutes: fitData.moveMinutes,
                axis: Axis.horizontal,
              ),
              const SizedBox(height: Sizes.spacingLarge),
              CategoryLabel(text: context.localization.homePageTrendsLabel),
              const SizedBox(height: Sizes.spacingMin),
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
