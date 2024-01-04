import 'package:stepel_flutter/imports.dart';

class PermissionsSubTitle extends StatelessWidget {
  const PermissionsSubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      context.localization.permissonsPageSubTitle,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w300,
        height: 1.5,
      ),
    );
  }
}
