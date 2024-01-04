import 'package:flutter/material.dart';
import 'package:stepel_flutter/feature/widgets/cardio_label.dart';
import 'package:stepel_flutter/feature/widgets/steps_label.dart';

class ChartBottomRow extends StatelessWidget {
  const ChartBottomRow({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CardioLabel(),
        SizedBox(width: 8),
        StepsLabel(),
      ],
    );
  }
}
