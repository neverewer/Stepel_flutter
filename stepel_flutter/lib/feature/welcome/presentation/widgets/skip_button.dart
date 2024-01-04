import 'package:stepel_flutter/imports.dart';

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
