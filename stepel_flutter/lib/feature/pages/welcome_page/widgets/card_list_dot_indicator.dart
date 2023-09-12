import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';
import 'package:stepel_flutter/imports.dart';

class CardListDotIndicator extends StatelessWidget {
  final PageController pageController;
  final int count;
  const CardListDotIndicator({super.key, required this.pageController, required this.count});

  @override
  Widget build(BuildContext context) {
    var dotIndicatorTheme = context.theme.extension<DotIndicatorTheme>()!;
    return SmoothPageIndicator(
      controller: pageController,
      count: count,
      effect: ExpandingDotsEffect(
        activeDotColor: dotIndicatorTheme.dotActiveColor,
        dotColor: dotIndicatorTheme.dotColor,
        dotHeight: Sizes.welcomePageDotIndicatorDotSize,
        dotWidth: Sizes.welcomePageDotIndicatorDotSize,
      ),
    );
  }
}
