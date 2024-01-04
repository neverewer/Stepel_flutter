import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Widget child;

  const CustomCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 8, left: 2, right: 2),
        child: SizedBox(
            width: double.infinity,
            height: 160,
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ))));
  }
}
