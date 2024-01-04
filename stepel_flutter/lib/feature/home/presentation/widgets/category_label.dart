import 'package:stepel_flutter/imports.dart';

class CategoryLabel extends StatelessWidget {
  final String text;

  const CategoryLabel({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: Sizes.homePageCategoryLabelPadding,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ));
  }
}
