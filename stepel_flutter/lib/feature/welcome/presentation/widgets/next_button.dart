import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/dependencies/widgets/dependencies_scope.dart';

class NextButton extends StatelessWidget {
  final PageController pageController;
  final int currentPageIndex;

  const NextButton({
    super.key,
    required this.pageController,
    required this.currentPageIndex,
  });

  void moveToNextPage(BuildContext context) => currentPageIndex == 3
      ? {
          DependenciesScope.of(context).localStorage.setIsFirstAppRun(false),
          context.router.pushNamed('/permissions'),
        }
      : pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        width: 250,
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
