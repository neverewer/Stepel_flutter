import 'package:stepel_flutter/imports.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Sizes.appBarExpendedHeight + context.safeArea.top,
      child: Padding(
        padding: const EdgeInsets.only(left: Sizes.spacingFull),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: PageTitle(
            text: context.localization.profilePageTitle,
            scaleFactor: Sizes.appBarExpandedTitleScaleFactor,
          ),
        ),
      ),
    );
  }
}
