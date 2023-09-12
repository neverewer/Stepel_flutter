import 'package:stepel_flutter/imports.dart';

class SkipButtonTheme extends ThemeExtension<SkipButtonTheme> {
  final ButtonStyle buttonStyle;
  final TextStyle textStyle;

  const SkipButtonTheme({required this.buttonStyle, required this.textStyle});

  @override
  ThemeExtension<SkipButtonTheme> copyWith({
    ButtonStyle? buttonStyle,
    TextStyle? textStyle,
  }) {
    return SkipButtonTheme(
      buttonStyle: buttonStyle ?? this.buttonStyle,
      textStyle: textStyle ?? this.textStyle,
    );
  }

  @override
  ThemeExtension<SkipButtonTheme> lerp(covariant ThemeExtension<SkipButtonTheme>? other, double t) {
    if (other is! SkipButtonTheme) {
      return this;
    }

    return SkipButtonTheme(
        buttonStyle: ButtonStyle.lerp(buttonStyle, other.buttonStyle, t) ?? buttonStyle,
        textStyle: TextStyle.lerp(textStyle, other.textStyle, t) ?? textStyle);
  }
}

class DotIndicatorTheme extends ThemeExtension<DotIndicatorTheme> {
  final Color dotColor;
  final Color dotActiveColor;

  const DotIndicatorTheme({required this.dotColor, required this.dotActiveColor});

  @override
  ThemeExtension<DotIndicatorTheme> copyWith({
    Color? dotColor,
    Color? dotActiveColor,
  }) {
    return DotIndicatorTheme(
      dotColor: dotColor ?? this.dotColor,
      dotActiveColor: dotActiveColor ?? this.dotActiveColor,
    );
  }

  @override
  ThemeExtension<DotIndicatorTheme> lerp(covariant ThemeExtension<DotIndicatorTheme>? other, double t) {
    if (other is! DotIndicatorTheme) {
      return this;
    }

    return DotIndicatorTheme(
      dotColor: Color.lerp(dotColor, other.dotColor, t) ?? dotColor,
      dotActiveColor: Color.lerp(dotActiveColor, other.dotActiveColor, t) ?? dotActiveColor,
    );
  }
}
