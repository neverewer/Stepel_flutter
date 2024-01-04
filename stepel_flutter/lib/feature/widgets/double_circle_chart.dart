import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';

class CircleDoubleChart extends StatelessWidget {
  final double firstValue;
  final double secondValue;
  final double firstValueTarget;
  final double secondValueTarget;
  final double? chartWidth;
  final double? size;
  final bool? animationEnabled;
  final bool? showLabel;
  final double? firstValueTextSize;
  final double? secondValueTextSize;

  const CircleDoubleChart({
    super.key,
    required this.firstValue,
    required this.secondValue,
    required this.firstValueTarget,
    required this.secondValueTarget,
    this.chartWidth,
    this.size,
    this.animationEnabled,
    this.showLabel,
    this.firstValueTextSize,
    this.secondValueTextSize,
  });

  @override
  Widget build(BuildContext context) {
    final doubleCircleChartTheme = context.theme.extension<DoubleCircleChartTheme>()!;
    return Stack(alignment: Alignment.center, children: [
      Chart(
        value: firstValue,
        target: firstValueTarget,
        animationEnabled: animationEnabled,
        chartWidth: chartWidth,
        size: size,
        trackColor: doubleCircleChartTheme.firstValueTrackColor,
        progressBarColor: doubleCircleChartTheme.firstValueProgressBarColor,
      ),
      Chart(
        value: secondValue,
        target: secondValueTarget,
        animationEnabled: animationEnabled,
        chartWidth: chartWidth,
        size: size != null ? size! * 0.8 : 180 * 0.8,
        trackColor: doubleCircleChartTheme.secondValueTrackColor,
        progressBarColor: doubleCircleChartTheme.secondValueProgressBarColor,
      ),
      ChartLabel(
        firstValue: firstValue,
        secondValue: secondValue,
        firstValueTextSize: firstValueTextSize,
        secondValueTextSize: secondValueTextSize,
        firstValueColor: doubleCircleChartTheme.firstValueTextColor,
        secondValueColor: doubleCircleChartTheme.secondValueTextColor,
      )
    ]);
  }
}

class Chart extends StatelessWidget {
  final double value;
  final double target;
  final double? chartWidth;
  final double? size;
  final bool? animationEnabled;
  final Color trackColor;
  final Color progressBarColor;

  const Chart({
    super.key,
    this.chartWidth,
    this.size,
    required this.value,
    required this.target,
    required this.animationEnabled,
    required this.trackColor,
    required this.progressBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return SleekCircularSlider(
      appearance: CircularSliderAppearance(
        animationEnabled: animationEnabled ?? true,
        size: size ?? 180,
        startAngle: 270,
        angleRange: 360,
        customWidths: CustomSliderWidths(
          progressBarWidth: chartWidth ?? 8,
          trackWidth: chartWidth ?? 8,
        ),
        customColors: CustomSliderColors(
          trackColor: trackColor,
          progressBarColor: progressBarColor,
          shadowMaxOpacity: 0,
          dotColor: Colors.transparent,
        ),
      ),
      min: 0,
      max: target,
      initialValue: value > target ? target : value,
      innerWidget: (value) {
        return const SizedBox();
      },
    );
  }
}

class ChartLabel extends StatelessWidget {
  final bool? showLabel;
  final double firstValue;
  final double secondValue;
  final double? firstValueTextSize;
  final double? secondValueTextSize;
  final Color firstValueColor;
  final Color secondValueColor;

  const ChartLabel({
    super.key,
    this.showLabel,
    this.secondValueTextSize,
    this.firstValueTextSize,
    required this.firstValue,
    required this.secondValue,
    required this.firstValueColor,
    required this.secondValueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: showLabel ?? true ? 1 : 0,
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              firstValue.toStringAsFixed(0),
              style: TextStyle(fontSize: firstValueTextSize ?? 36, fontWeight: FontWeight.w700, color: firstValueColor),
            ),
            Text(
              secondValue.toStringAsFixed(0),
              style:
                  TextStyle(fontSize: secondValueTextSize ?? 28, fontWeight: FontWeight.w500, color: secondValueColor),
            )
          ],
        )));
  }
}
