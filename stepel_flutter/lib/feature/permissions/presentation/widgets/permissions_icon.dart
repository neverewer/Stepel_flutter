import 'package:stepel_flutter/imports.dart';

class PermissionsIcon extends StatelessWidget {
  const PermissionsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var permissionIconTheme = context.theme.extension<PermissionsIconTheme>()!;
    return Icon(
      Icons.directions_run,
      size: Sizes.permissionsPageIconSize,
      color: permissionIconTheme.color,
    );
  }
}
