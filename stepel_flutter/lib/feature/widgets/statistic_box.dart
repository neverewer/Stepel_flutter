import 'package:stepel_flutter/imports.dart';

class StatisticBox extends StatelessWidget {
  final String value;
  final String label;
  final Color? valueColor;
  final double? valueFontSize;
  final double? labelFontSize;

  const StatisticBox({
    super.key,
    required this.value,
    required this.label,
    this.valueColor,
    this.valueFontSize,
    this.labelFontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: valueFontSize ?? 24,
            letterSpacing: 1.05,
            color: valueColor ?? Themes.primaryBlueColorLight,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: Sizes.spacingMin,
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: labelFontSize ?? 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
