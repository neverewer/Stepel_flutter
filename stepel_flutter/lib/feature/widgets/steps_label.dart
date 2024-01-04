import 'package:flutter_svg/flutter_svg.dart';
import 'package:stepel_flutter/imports.dart';

class StepsLabel extends StatelessWidget {
  const StepsLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final stepsLabelTheme = context.theme.extension<StepsLabelTheme>()!;
    return Row(
      children: [
        SvgPicture.asset('assets/images/sprint.svg',
            width: Sizes.stepsLabelImageSize,
            height: Sizes.stepsLabelImageSize,
            colorFilter: ColorFilter.mode(
              stepsLabelTheme.imageColor,
              BlendMode.srcIn,
            )),
        const SizedBox(width: Sizes.spacingSmall),
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
