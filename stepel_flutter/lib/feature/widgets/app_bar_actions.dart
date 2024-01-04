import 'package:stepel_flutter/imports.dart';

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
      padding: padding ?? Sizes.appBarActionsPadding,
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
