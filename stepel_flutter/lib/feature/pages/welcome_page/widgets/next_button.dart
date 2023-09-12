import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/imports.dart';

class NextButton extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;
  const NextButton({super.key, required this.pageController, required this.currentPageIndex});

  void moveToNextPage() => pageController.nextPage(
        duration: Settings.welcomePageCardListAnamationDuration,
        curve: Settings.welcomePageCardListCurve,
      );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Sizes.welcomePageNextButtonHeight,
        width: Sizes.welcomePageNextButtonWidth,
        child: TextButton(
          onPressed: moveToNextPage,
          child: Text(
            currentPageIndex == 3
                ? context.localization.welcomePageNextButtonStartText
                : context.localization.welcomePageNextButtonStartText,
          ),
        ));
  }
}
