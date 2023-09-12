import 'package:stepel_flutter/imports.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: Sizes.welcomePageCardPadding,
      child: Card(
        elevation: Sizes.welcomePageCardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: Sizes.borderRadius,
        ),
      ),
    );
  }
}
