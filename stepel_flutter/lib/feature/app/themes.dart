import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';
import 'package:stepel_flutter/imports.dart';

class Themes {
  Themes._();

  static const double _bodyFontSize = 16;

  static const Color _transparentColor = Colors.transparent;

  static const Color _backgroundColorLight = Color(0xFFfdfdfd);
  static const Color _backgroundColorDark = Color(0xFF202125);

  static const Color primaryDarkBlueColorLight = Color(0xFF094198);
  static const Color primaryBlueColorLight = Color(0xFF2073d9);
  static const Color primaryTurquoiseColorLight = Color(0xFF01c4a2);

  static const Color primaryDarkBlueColorDark = Color(0xFF4172c0);
  static const Color primaryBlueColorDark = Color(0xFF7ba5f1);
  static const Color primaryTurquoiseColorDark = Color(0xFF08d5ac);

  static const Color _dotIndicatorDotColorDark = Color(0xFFbac7da);

  static const Color _textButtonTextColorDark = Color(0xFFbac7da);

  static Color primaryBlueColorLightTranslucent = primaryBlueColorLight.withOpacity(0.2);
  static Color primaryBlueColorDarkTranslucent = primaryBlueColorDark.withOpacity(0.2);

  static const Color _skipButtonTextColorDark = Color(0xFFD6D6D6);
  static const Color _skipButtonTextColorLight = Color(0xFF424242);
  static const Color _skipButtonOverlayColorLight = Color(0xFFd8d8db);
  static const Color _skipButtonOverlayColorDark = Color(0xFF5e606c);

  static SkipButtonTheme getSkipButtonTheme(bool light) {
    return SkipButtonTheme(
      buttonStyle: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(_transparentColor),
          overlayColor: MaterialStatePropertyAll(light ? _skipButtonOverlayColorLight : _skipButtonOverlayColorDark)),
      textStyle: TextStyle(
        color: light ? _skipButtonTextColorLight : _skipButtonTextColorDark,
        fontSize: _bodyFontSize,
        decoration: TextDecoration.underline,
      ),
    );
  }

  static DotIndicatorTheme getDotIndicatorTheme(bool light) {
    return DotIndicatorTheme(
      dotColor: light ? primaryBlueColorLightTranslucent : primaryBlueColorDarkTranslucent,
      dotActiveColor: light ? primaryBlueColorLight : _dotIndicatorDotColorDark,
    );
  }

  static TextButtonThemeData getTextButtonTheme(bool light) {
    return TextButtonThemeData(
        style: ButtonStyle(
            foregroundColor: MaterialStatePropertyAll(light ? primaryBlueColorLight : _textButtonTextColorDark),
            backgroundColor:
                MaterialStatePropertyAll(light ? primaryBlueColorLightTranslucent : primaryBlueColorDarkTranslucent),
            textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: _bodyFontSize))));
  }

  static ThemeData get(bool light) {
    return ThemeData(
      brightness: light ? Brightness.light : Brightness.dark,
      scaffoldBackgroundColor: light ? _backgroundColorLight : _backgroundColorDark,
      extensions: [
        getSkipButtonTheme(light),
        getDotIndicatorTheme(light),
      ],
      textButtonTheme: getTextButtonTheme(light),
    );
  }
}
