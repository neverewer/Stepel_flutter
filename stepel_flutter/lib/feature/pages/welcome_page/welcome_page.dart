import 'package:stepel_flutter/feature/pages/welcome_page/widgets/card_list.dart';
import 'package:stepel_flutter/feature/pages/welcome_page/widgets/card_list_dot_indicator.dart';
import 'package:stepel_flutter/feature/pages/welcome_page/widgets/next_button.dart';
import 'package:stepel_flutter/feature/pages/welcome_page/widgets/skip_button.dart';
import 'package:stepel_flutter/feature/pages/welcome_page/widgets/welcome_card.dart';
import 'package:stepel_flutter/imports.dart';

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

  void updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

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
                  onPageChanged: updatePageIndex,
                  children: _cards,
                ),
                const SizedBox(
                  height: Sizes.spacingLarge,
                ),
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
