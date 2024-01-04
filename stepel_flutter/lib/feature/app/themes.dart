import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stepel_flutter/core/utils/extensions/theme_extension.dart';

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
  static const Color _rejectButtonColorDark = Color(0xFF8ec3ff);
  static const Color _permissionIconColorDark = Color(0xFF8ec3ff);
  static const Color _confirmButtonBackgroundColorDark = Color(0xFF8ec3ff);
  static const Color _confirmButtonTextColorLight = Color(0xFFFFFFFF);
  static const Color _confirmButtonTextColorDark = Color(0xFF12222f);
  static const Color _bottomAppBarColorLight = Color(0xCCFFFFFF);
  static const Color _bottomAppBarColorDark = Color(0xF2343539);
  static const Color _cardDarkColor = Color(0xFF2a2b2f);

  static SkipButtonTheme getSkipButtonTheme(bool light) => SkipButtonTheme(
        buttonStyle: ButtonStyle(
            backgroundColor: const MaterialStatePropertyAll(_transparentColor),
            overlayColor: MaterialStatePropertyAll(light ? _skipButtonOverlayColorLight : _skipButtonOverlayColorDark)),
        textStyle: TextStyle(
          color: light ? _skipButtonTextColorLight : _skipButtonTextColorDark,
          fontSize: _bodyFontSize,
          fontWeight: FontWeight.w500,
          decoration: TextDecoration.underline,
        ),
      );

  static DotIndicatorTheme getDotIndicatorTheme(bool light) => DotIndicatorTheme(
        dotColor: light ? primaryBlueColorLightTranslucent : primaryBlueColorDarkTranslucent,
        dotActiveColor: light ? primaryBlueColorLight : _dotIndicatorDotColorDark,
      );

  static TextButtonThemeData getTextButtonTheme(bool light) => TextButtonThemeData(
      style: ButtonStyle(
          foregroundColor: MaterialStatePropertyAll(light ? primaryBlueColorLight : _textButtonTextColorDark),
          backgroundColor:
              MaterialStatePropertyAll(light ? primaryBlueColorLightTranslucent : primaryBlueColorDarkTranslucent),
          textStyle: const MaterialStatePropertyAll(TextStyle(
            fontSize: _bodyFontSize,
            fontWeight: FontWeight.w500,
          ))));

  static PermissionsIconTheme getPermissionsIconTheme(bool light) =>
      PermissionsIconTheme(color: light ? primaryBlueColorLight : _permissionIconColorDark);

  static RejectButtonTheme getRejectButtonTheme(bool light) => RejectButtonTheme(
      backgroundColor: _transparentColor, textColor: light ? primaryBlueColorLight : _rejectButtonColorDark);

  static ConfirmButtonTheme getConfirmButtonTheme(bool light) => ConfirmButtonTheme(
      backgroundColor: light ? primaryBlueColorLight : _confirmButtonBackgroundColorDark,
      textColor: light ? _confirmButtonTextColorLight : _confirmButtonTextColorDark);

  static BottomNavigationBarThemeData getBottomNavigationBarTheme(bool light) => BottomNavigationBarThemeData(
        backgroundColor: light ? _bottomAppBarColorLight : _bottomAppBarColorDark,
        showUnselectedLabels: false,
        selectedItemColor: light ? primaryBlueColorLight : primaryBlueColorDark,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      );

  static DoubleCircleChartTheme getDoubleCircleChartTheme(bool light) => DoubleCircleChartTheme(
        firstValueTrackColor:
            light ? primaryTurquoiseColorLight.withOpacity(0.2) : primaryTurquoiseColorDark.withOpacity(0.2),
        secondValueTrackColor:
            light ? primaryDarkBlueColorLight.withOpacity(0.2) : primaryDarkBlueColorDark.withOpacity(0.2),
        firstValueTextColor: light ? primaryTurquoiseColorLight : primaryTurquoiseColorDark,
        secondValueTextColor: light ? primaryDarkBlueColorLight : primaryDarkBlueColorDark,
        firstValueProgressBarColor: light ? primaryTurquoiseColorLight : primaryTurquoiseColorDark,
        secondValueProgressBarColor: light ? primaryDarkBlueColorLight : primaryDarkBlueColorDark,
      );

  static CardioLabelTheme getCardioLabelTheme(bool light) =>
      CardioLabelTheme(imageColor: light ? primaryTurquoiseColorLight : primaryTurquoiseColorDark);

  static StepsLabelTheme getStepsLabelTheme(bool light) =>
      StepsLabelTheme(imageColor: light ? primaryDarkBlueColorLight : primaryDarkBlueColorDark);

  static CardTheme getCardTheme(bool light) => CardTheme(
      color: light ? Colors.white : _cardDarkColor,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))));

  static AppBarTheme getAppBarTheme(bool light) => AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: light ? _backgroundColorLight : _backgroundColorDark),
      color: light ? _backgroundColorLight : _backgroundColorDark,
      actionsIconTheme: IconThemeData(
        color: light ? Colors.black : Colors.white,
      ),
      titleTextStyle: TextStyle(
        color: light ? Colors.black : Colors.white,
        fontWeight: FontWeight.w400,
        fontSize: 18,
      ));

  static ProfileInfoBoxTheme getProfileInfoBoxTheme(bool light) => ProfileInfoBoxTheme(
        borderActiveColor: light ? Colors.grey.shade700 : const Color(0xFFdecaca),
        borderSelectedColor: light ? primaryBlueColorLight : primaryBlueColorDark,
        borderUnactiveColor: light ? Colors.grey.shade300 : const Color(0xFF37383c),
        contentActiveColor: light ? Colors.grey.shade700 : const Color(0xFFdecaca),
        contentUnactiveColor: light ? Colors.grey.shade300 : const Color(0xFF6e6f73),
      );

  static SwitchThemeData getSwitchTheme(bool light) => SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(light ? primaryBlueColorLight : primaryBlueColorDark),
        trackColor:
            MaterialStatePropertyAll(light ? primaryBlueColorLightTranslucent : primaryBlueColorDarkTranslucent),
      );

  static TimePickerThemeData getTimePickerTheme(bool light) => TimePickerThemeData(
        backgroundColor: light ? Colors.white : _cardDarkColor,
        cancelButtonStyle: getTextButtonTheme(light)
            .style!
            .copyWith(backgroundColor: const MaterialStatePropertyAll(_transparentColor)),
        confirmButtonStyle: getTextButtonTheme(light)
            .style!
            .copyWith(backgroundColor: const MaterialStatePropertyAll(_transparentColor)),
      );

  static DialogTheme getDialogTheme(bool light) => DialogTheme(
        backgroundColor: light ? Colors.white : _cardDarkColor,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      );

  static ThemeData get(bool light) => ThemeData(
      useMaterial3: false,
      brightness: light ? Brightness.light : Brightness.dark,
      fontFamily: 'Roboto',
      scaffoldBackgroundColor: light ? _backgroundColorLight : _backgroundColorDark,
      extensions: [
        getSkipButtonTheme(light),
        getDotIndicatorTheme(light),
        getPermissionsIconTheme(light),
        getRejectButtonTheme(light),
        getConfirmButtonTheme(light),
        getDoubleCircleChartTheme(light),
        getCardioLabelTheme(light),
        getStepsLabelTheme(light),
        getProfileInfoBoxTheme(light),
      ],
      textButtonTheme: getTextButtonTheme(light),
      bottomNavigationBarTheme: getBottomNavigationBarTheme(light),
      cardTheme: getCardTheme(light),
      appBarTheme: getAppBarTheme(light),
      switchTheme: getSwitchTheme(light),
      dialogTheme: getDialogTheme(light),
      timePickerTheme: getTimePickerTheme(light));
}
