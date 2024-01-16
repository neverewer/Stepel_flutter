import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/dependencies/widgets/dependencies_scope.dart';

class WelcomePageStartButton extends StatelessWidget {
  const WelcomePageStartButton({super.key});

  void moveToPermissionsPage(BuildContext context) {
    DependenciesScope.of(context).localStorage.setIsFirstAppRun(false);
    context.router.pushNamed('/permissions');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 48,
        width: 250,
        child: TextButton(
          onPressed: () => moveToPermissionsPage(context),
          child: Text(context.localization.welcomePageStartButtonText),
        ));
  }
}
