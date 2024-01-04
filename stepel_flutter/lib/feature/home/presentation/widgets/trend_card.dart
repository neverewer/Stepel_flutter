import 'package:stepel_flutter/feature/home/presentation/widgets/custom_card.dart';
import 'package:stepel_flutter/feature/home/presentation/widgets/weekly_bar_chart.dart';
import 'package:stepel_flutter/imports.dart';

class TrendCard extends StatelessWidget {
  final String topLabel;
  final int value;
  final Color? color;
  final List<double> data;
  final double? goal;

  const TrendCard({
    super.key,
    required this.topLabel,
    required this.value,
    this.color,
    required this.data,
    this.goal,
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                topLabel,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: Sizes.spacingSmall),
              Text(
                context.localization.homePageTrendsSubTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StatisticBox(
                value: value.toString(),
                label: context.localization.homePageTrendsStatisticBoxText,
                valueColor: color ?? Themes.primaryBlueColorDark,
              ),
              SizedBox(
                  height: double.infinity,
                  width: 220,
                  child: WeeklyBarChart(
                    data: data,
                    barColor: color ?? Themes.primaryBlueColorDark,
                    goal: goal,
                  )),
            ],
          ))
        ],
      ),
    );
  }
}
