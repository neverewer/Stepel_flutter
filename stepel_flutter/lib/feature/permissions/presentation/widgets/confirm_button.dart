import 'package:stepel_flutter/core/dependencies/services/permissions_service.dart';
import 'package:stepel_flutter/imports.dart';

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
