import 'package:stepel_flutter/imports.dart';

class JournalListItem extends StatelessWidget {
  final FitDataEntity fitData;

  const JournalListItem({
    super.key,
    required this.fitData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.journalPageListItemPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DateWidget(date: fitData.dateToString()),
          const SizedBox(height: Sizes.spacingHalf),
          const Divider(thickness: 1.5),
          const SizedBox(height: Sizes.spacingHalf),
          ItemContent(fitData: fitData),
        ],
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  final String date;

  const DateWidget({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Sizes.journalPageListItemInnerPadding,
      child: Text(
        date,
        style: const TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}

class ItemContent extends StatelessWidget {
  final FitDataEntity fitData;

  const ItemContent({
    super.key,
    required this.fitData,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ItemStatisticColumn(
            calories: fitData.calories.toInt(),
            distance: fitData.moveDistance,
            moveTimeInMinutes: fitData.moveMinutes,
          ),
          ItemChartWithLabel(
            steps: fitData.steps.toDouble(),
            cardioPoints: fitData.cardioPoints.toDouble(),
          )
        ],
      ),
    );
  }
}

class ItemStatisticColumn extends StatelessWidget {
  final int calories;
  final double distance;
  final int moveTimeInMinutes;

  const ItemStatisticColumn({
    super.key,
    required this.calories,
    required this.distance,
    required this.moveTimeInMinutes,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: SizedBox(
        height: double.infinity,
        child: IntrinsicHeight(
          child: StatisticLine(
            axis: Axis.vertical,
            calories: calories,
            distance: distance,
            moveTimeInMinutes: moveTimeInMinutes,
          ),
        ),
      ),
    );
  }
}

class ItemChartWithLabel extends StatelessWidget {
  final double steps;
  final double cardioPoints;

  const ItemChartWithLabel({
    super.key,
    required this.steps,
    required this.cardioPoints,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleDoubleChart(
            firstValue: steps,
            secondValue: cardioPoints,
            firstValueTarget: 8000,
            secondValueTarget: 40,
            showLabel: true,
            animationEnabled: false,
            chartWidth: Sizes.jorunalPageListItemChartWidth,
            size: Sizes.journalPageListItemChartSize,
            firstValueTextSize: 22,
            secondValueTextSize: 18,
          ),
          const SizedBox(
            height: Sizes.spacingFull,
          ),
          const ChartBottomLabel(),
        ],
      ),
    );
  }
}

class ChartBottomLabel extends StatelessWidget {
  const ChartBottomLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        StepsLabel(),
        CardioLabel(),
      ],
    );
  }
}
