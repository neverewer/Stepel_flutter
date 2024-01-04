import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';
import 'package:stepel_flutter/feature/dependencies/widgets/dependencies_scope.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({super.key});

  @override
  Widget build(BuildContext context) {
    var skipButtonTheme = context.theme.extension<SkipButtonTheme>()!;
    return TextButton(
        style: skipButtonTheme.buttonStyle,
        child: Text(
          context.localization.welcomePageSkipButtonText,
          style: skipButtonTheme.textStyle,
        ),
        onPressed: () {
          DependenciesScope.of(context).localStorage.setIsFirstAppRun(false);
          context.router.pushNamed('/permissions');
        });
  }
}
