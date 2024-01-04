import 'package:flutter/material.dart';

class CardList extends StatelessWidget {
  final PageController pageController;
  final void Function(int) onPageChanged;
  final List<Widget> children;

  const CardList({
    super.key,
    required this.pageController,
    required this.onPageChanged,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: PageView(
          controller: pageController,
          physics: const BouncingScrollPhysics(),
          children: children,
          onPageChanged: (pageIndex) {
            onPageChanged(pageIndex);
          }),
    );
  }
}
