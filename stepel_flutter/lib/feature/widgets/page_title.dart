import 'package:stepel_flutter/imports.dart';

class PageTitle extends StatelessWidget {
  final String text;
  final double? scaleFactor;

  const PageTitle({
    super.key,
    required this.text,
    this.scaleFactor,
  });

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).appBarTheme.titleTextStyle;
    return Text(text,
        style: style!.copyWith(fontSize: scaleFactor != null ? style.fontSize! * scaleFactor! : style.fontSize));
  }
}
