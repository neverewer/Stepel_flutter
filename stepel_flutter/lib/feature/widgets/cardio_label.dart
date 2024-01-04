import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';

class CardioLabel extends StatelessWidget {
  const CardioLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final cardioLabelTheme = context.theme.extension<CardioLabelTheme>()!;
    return Row(
      children: [
        SvgPicture.asset('assets/images/heart.svg',
            width: 14,
            height: 14,
            colorFilter: ColorFilter.mode(
              cardioLabelTheme.imageColor,
              BlendMode.srcIn,
            )),
        const SizedBox(width: 4),
        Text(
          context.localization.cardioPointsLabelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );
  }
}
