import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/permissions/permissions_service.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';
import 'package:stepel_flutter/feature/dependencies/widgets/dependencies_scope.dart';

class ConfirmButton extends StatelessWidget {
  const ConfirmButton({super.key});

  @override
  Widget build(BuildContext context) {
    var confirmButtonTheme = context.theme.extension<ConfirmButtonTheme>()!;
    var localStorage = DependenciesScope.of(context).localStorage;
    return ElevatedButton(
      onPressed: () async {
        var isPermissionsGranted = await PermissionsService.getPermissions();
        localStorage.setIsPermissionsGranted(isPermissionsGranted);
        if (isPermissionsGranted && context.mounted) {
          context.router.replaceNamed('/main');
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(confirmButtonTheme.backgroundColor),
        foregroundColor: MaterialStatePropertyAll(confirmButtonTheme.textColor),
      ),
      child: Text(context.localization.permissionsPageConfirmButtonText),
    );
  }
}
