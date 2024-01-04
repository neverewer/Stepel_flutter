import 'package:stepel_flutter/feature/dialogs/info_dialog.dart';
import 'package:stepel_flutter/imports.dart';

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
