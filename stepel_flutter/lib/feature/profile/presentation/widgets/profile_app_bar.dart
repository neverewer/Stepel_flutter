import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';
import 'package:stepel_flutter/feature/widgets/page_title.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120 + context.safeArea.top,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: PageTitle(
            text: context.localization.profilePageTitle,
            scaleFactor: 2,
          ),
        ),
      ),
    );
  }
}
