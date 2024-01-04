import 'package:stepel_flutter/imports.dart';

class NextButton extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;

  const NextButton({
    super.key,
    required this.pageController,
    required this.currentPageIndex,
  });

  void moveToNextPage(BuildContext context) {
    currentPageIndex == 3
        ? {
            DependenciesScope.of(context).localStorage.setIsFirstAppRun(false),
            context.router.pushNamed('/permissions'),
          }
        : pageController.nextPage(
            duration: Settings.welcomePageCardListAnamationDuration,
            curve: Settings.welcomePageCardListCurve,
          );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Sizes.welcomePageNextButtonHeight,
        width: Sizes.welcomePageNextButtonWidth,
        child: TextButton(
          onPressed: () => moveToNextPage(context),
          child: Text(
            currentPageIndex == 3
                ? context.localization.welcomePageNextButtonStartText
                : context.localization.welcomePageNextButtonNextText,
          ),
        ));
  }
}
