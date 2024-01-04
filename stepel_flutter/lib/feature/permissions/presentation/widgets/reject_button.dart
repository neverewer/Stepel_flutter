import 'package:flutter/services.dart';
import 'package:stepel_flutter/imports.dart';

class RejectButton extends StatelessWidget {
  const RejectButton({super.key});

  @override
  Widget build(BuildContext context) {
    var rejectButtonTheme = context.theme.extension<RejectButtonTheme>()!;
    return TextButton(
      onPressed: () => SystemNavigator.pop(),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(rejectButtonTheme.backgroundColor),
        foregroundColor: MaterialStatePropertyAll(rejectButtonTheme.textColor),
      ),
      child: Text(
        context.localization.permissionsPageRejectButtonText,
      ),
    );
  }
}
