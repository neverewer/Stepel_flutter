import 'package:stepel_flutter/imports.dart';

class ChartBottomRow extends StatelessWidget {
  const ChartBottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardioLabel(),
        SizedBox(width: Sizes.spacingHalf),
        StepsLabel(),
      ],
    );
  }
}
