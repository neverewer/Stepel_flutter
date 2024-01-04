import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/widgets/app_bar_actions.dart';

class CustomAppBar extends StatelessWidget {
  final IconData appBarActionsIcon;
  final Function()? iconCallBack;

  const CustomAppBar({
    super.key,
    this.iconCallBack,
    required this.appBarActionsIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.safeArea.top),
      child: SizedBox(
        height: kToolbarHeight,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppBarActions(
              icon: appBarActionsIcon,
              iconCallBack: iconCallBack,
            )
          ],
        ),
      ),
    );
  }
}
