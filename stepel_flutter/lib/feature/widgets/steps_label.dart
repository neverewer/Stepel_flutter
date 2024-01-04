import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';

class StepsLabel extends StatelessWidget {
  const StepsLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final stepsLabelTheme = context.theme.extension<StepsLabelTheme>()!;
    return Row(
      children: [
        SvgPicture.asset('assets/images/sprint.svg',
            width: 14,
            height: 14,
            colorFilter: ColorFilter.mode(
              stepsLabelTheme.imageColor,
              BlendMode.srcIn,
            )),
        const SizedBox(width: 4),
        Text(
          context.localization.stepsLabelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
