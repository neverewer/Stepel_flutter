import 'package:stepel_flutter/feature/permissions/presentation/widgets/confirm_button.dart';
import 'package:stepel_flutter/feature/permissions/presentation/widgets/reject_button.dart';
import 'package:stepel_flutter/imports.dart';

class PermissionsButtons extends StatelessWidget {
  const PermissionsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        RejectButton(),
        ConfirmButton(),
      ],
    );
  }
}
