import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';

class PermissionsIcon extends StatelessWidget {
  const PermissionsIcon({super.key});

  @override
  Widget build(BuildContext context) {
    var permissionIconTheme = context.theme.extension<PermissionsIconTheme>()!;
    return Icon(
      Icons.directions_run,
      size: 50,
      color: permissionIconTheme.color,
    );
  }
}
