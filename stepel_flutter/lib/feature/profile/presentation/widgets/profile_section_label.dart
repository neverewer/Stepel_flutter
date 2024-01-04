import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/utils/extensions/context_extension.dart';

class ProfileSectionLabel extends StatelessWidget {
  final String text;

  const ProfileSectionLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: context.theme.textTheme.bodyMedium,
      ),
    );
  }
}
