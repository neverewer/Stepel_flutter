import 'package:stepel_flutter/imports.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations_en.dart';

extension ContextExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  EdgeInsets get safeArea => MediaQuery.of(this).padding;
  ThemeData get theme => Theme.of(this);
  AppLocalizations get localization => AppLocalizations.of(this) ?? AppLocalizationsEn();
}
