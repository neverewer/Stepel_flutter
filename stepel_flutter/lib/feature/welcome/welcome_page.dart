import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/card_list.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/card_list_dot_indicator.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/next_button.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/skip_button.dart';
import 'package:stepel_flutter/feature/welcome/presentation/widgets/welcome_card.dart';

@RoutePage()
class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _pageController = PageController(initialPage: 0);

  int _currentPageIndex = 0;

  final List<Widget> _cards = const [
    WelcomeCard(),
    WelcomeCard(),
    WelcomeCard(),
    WelcomeCard(),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void updateCurrentPageIndex(int index) => setState(() {
        _currentPageIndex = index;
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CardList(
                  pageController: _pageController,
                  onPageChanged: updateCurrentPageIndex,
                  children: _cards,
                ),
                const SizedBox(height: 32),
                CardListDotIndicator(
                  pageController: _pageController,
                  count: _cards.length,
                ),
              ],
            )),
        Flexible(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                NextButton(
                  pageController: _pageController,
                  currentPageIndex: _currentPageIndex,
                ),
                const SkipButton(),
              ],
            ))
      ],
    ));
  }
}
