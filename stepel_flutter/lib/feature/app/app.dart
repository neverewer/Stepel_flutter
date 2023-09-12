import 'package:stepel_flutter/core/router/router.dart';
import 'package:stepel_flutter/imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  final AppRouter router;
  const App({super.key, required this.router});

  @override
  Widget build(BuildContext context) {
    var routerConfig = router.config();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: routerConfig,
      theme: Themes.get(true),
      darkTheme: Themes.get(false),
      locale: const Locale('ru'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
