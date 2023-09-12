import 'package:stepel_flutter/feature/pages/welcome_page/welcome_page.dart';
import 'package:stepel_flutter/imports.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: WelcomeRoute.page,
          path: '/',
        ),
      ];
}
