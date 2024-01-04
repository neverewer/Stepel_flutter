import 'package:flutter_svg/flutter_svg.dart';
import 'package:stepel_flutter/imports.dart';

class CardioLabel extends StatelessWidget {
  const CardioLabel({super.key});

  @override
  Widget build(BuildContext context) {
    final cardioLabelTheme = context.theme.extension<CardioLabelTheme>()!;
    return Row(
      children: [
        SvgPicture.asset('assets/images/heart.svg',
            width: Sizes.cardioLabelImageSize,
            height: Sizes.cardioLabelImageSize,
            colorFilter: ColorFilter.mode(
              cardioLabelTheme.imageColor,
              BlendMode.srcIn,
            )),
        const SizedBox(width: Sizes.spacingSmall),
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
