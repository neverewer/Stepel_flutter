import 'package:flutter/material.dart';

class AppBarActions extends StatelessWidget {
  final IconData icon;
  final EdgeInsets? padding;
  final Function()? iconCallBack;

  const AppBarActions({
    super.key,
    required this.icon,
    this.iconCallBack,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 8),
      child: IconButton(
        onPressed: iconCallBack,
        icon: Icon(
          icon,
          size: 24,
        ),
      ),
    );
  }
}
