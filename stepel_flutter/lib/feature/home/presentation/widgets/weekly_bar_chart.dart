import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';

class WeeklyBarChart extends StatelessWidget {
  final List<double> data;
  final Color barColor;
  final double? goal;

  const WeeklyBarChart({
    super.key,
    required this.data,
    required this.barColor,
    this.goal,
  });

  List<BarChartGroupData>? getBarGroups(List<double> dataList, Color barColor) {
    return dataList
        .asMap()
        .entries
        .map((entry) => BarChartGroupData(x: entry.key.toInt(), barRods: [
              BarChartRodData(
                toY: entry.value,
                color: barColor,
                width: 14,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(4), topRight: Radius.circular(4)),
              )
            ]))
        .toList();
  }

  Widget getTitles(TextStyle? titleStyle, double value, TitleMeta meta) {
    var date = DateTime.now().subtract(Duration(days: 7 - (value.toInt() + 1)));
    var weekDay = date.weekday;

    String text;
    switch (weekDay) {
      case 1:
        text = 'П';
        break;
      case 2:
        text = 'В';
        break;
      case 3:
        text = 'С';
        break;
      case 4:
        text = 'Ч';
        break;
      case 5:
        text = 'П';
        break;
      case 6:
        text = 'С';
        break;
      case 7:
        text = 'В';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text,
          style: weekDay == DateTime.now().weekday
              ? titleStyle!.copyWith(fontWeight: FontWeight.bold, color: Colors.white)
              : titleStyle!.copyWith(fontWeight: FontWeight.w400, color: Colors.grey[500])),
    );
  }

  @override
  Widget build(BuildContext context) {
    final titlesStyle = context.theme.textTheme.bodySmall;
    double maxValue;

    final maxDataValue = data.reduce(max);

    goal != null ? maxValue = maxDataValue > goal! ? maxDataValue : goal! : maxValue = maxDataValue;

    maxValue *= 1.1;

    return BarChart(BarChartData(
        maxY: maxValue,
        minY: 0,
        extraLinesData: goal == null
            ? null
            : ExtraLinesData(
                horizontalLines: [
                  HorizontalLine(y: goal!, color: Colors.grey, dashArray: [5, 4], strokeWidth: 1),
                ],
              ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) => getTitles(titlesStyle, value, meta),
            ),
          ),
        ),
        barTouchData: BarTouchData(
            enabled: true,
            touchTooltipData: BarTouchTooltipData(
              tooltipBgColor: Colors.white,
              tooltipRoundedRadius: 20,
              tooltipBorder: const BorderSide(width: 0.01, color: Colors.grey),
            )),
        barGroups: getBarGroups(data, barColor)));
  }
}
