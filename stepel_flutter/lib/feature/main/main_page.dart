import 'package:stepel_flutter/core/router/router.dart';
import 'package:stepel_flutter/imports.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.pageView(
      animatePageTransition: false,
      physics: const NeverScrollableScrollPhysics(),
      routes: const [
        HomeRoute(),
        JournalRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, _) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          extendBody: true,
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: tabsRouter.setActiveIndex,
            items: [
              BottomNavigationBarItem(
                label: context.localization.mainPageHomePageButtonText,
                icon: const Icon(Icons.adjust),
              ),
              BottomNavigationBarItem(
                label: context.localization.mainPageJournalPageButtonText,
                icon: const Icon(Icons.wysiwyg),
              ),
              BottomNavigationBarItem(
                label: context.localization.mainPageProfilePageButtonText,
                icon: const Icon(Icons.person_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
