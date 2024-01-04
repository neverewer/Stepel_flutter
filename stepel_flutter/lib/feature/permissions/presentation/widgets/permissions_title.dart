import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';

class PermissionsTitle extends StatelessWidget {
  const PermissionsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.permissonsPageTitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
