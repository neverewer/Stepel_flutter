import 'package:auto_route/auto_route.dart';
import 'package:stepel_flutter/feature/home/home_page.dart';
import 'package:stepel_flutter/feature/journal/journal_page.dart';
import 'package:stepel_flutter/feature/main/main_page.dart';
import 'package:stepel_flutter/feature/permissions/permissions_page.dart';
import 'package:stepel_flutter/feature/profile/profile_page.dart';
import 'package:stepel_flutter/feature/welcome/welcome_page.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  final bool isFirstAppRun;

  AppRouter({
    super.navigatorKey,
    required this.isFirstAppRun,
  });

  @override
  List<AutoRoute> get routes => isFirstAppRun
      ? [
          AutoRoute(
            page: WelcomeRoute.page,
            path: '/',
          ),
          AutoRoute(
            page: PermissionsRoute.page,
            path: '/permissions',
          ),
          AutoRoute(page: MainRoute.page, path: '/main', children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: JournalRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ])
        ]
      : [
          AutoRoute(
            page: PermissionsRoute.page,
            path: '/',
          ),
          AutoRoute(page: MainRoute.page, path: '/main', children: [
            AutoRoute(page: HomeRoute.page),
            AutoRoute(page: JournalRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ])
        ];
}
