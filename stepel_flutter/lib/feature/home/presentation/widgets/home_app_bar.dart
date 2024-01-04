import 'package:flutter/material.dart';
import 'package:stepel_flutter/feature/dialogs/info_dialog.dart';
import 'package:stepel_flutter/feature/widgets/custom_app_bar.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      appBarActionsIcon: Icons.info_outline,
      iconCallBack: () => showInfoDialog(context),
    );
  }
}
