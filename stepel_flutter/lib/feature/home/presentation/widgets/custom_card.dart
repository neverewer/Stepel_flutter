import 'package:stepel_flutter/imports.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: Sizes.homePageCustomCardPadding,
        child: SizedBox(
            width: double.infinity,
            height: Sizes.homePageCustomCardHeight,
            child: Card(
                child: Padding(
              padding: Sizes.homePageBoxInnerPadding,
              child: child,
            ))));
  }
}
