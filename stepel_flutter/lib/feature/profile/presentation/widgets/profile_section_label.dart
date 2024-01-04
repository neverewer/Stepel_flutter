import 'package:stepel_flutter/imports.dart';

class ProfileSectionLabel extends StatelessWidget {
  final String text;

  const ProfileSectionLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: Sizes.spacingFull),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
