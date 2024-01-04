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

class PermissionsIconTheme extends ThemeExtension<PermissionsIconTheme> {
  final Color color;

  PermissionsIconTheme({required this.color});

  @override
  ThemeExtension<PermissionsIconTheme> copyWith({
    Color? color,
  }) {
    return PermissionsIconTheme(color: color ?? this.color);
  }

  @override
  ThemeExtension<PermissionsIconTheme> lerp(covariant ThemeExtension<PermissionsIconTheme>? other, double t) {
    if (other is! PermissionsIconTheme) {
      return this;
    }
    return PermissionsIconTheme(color: Color.lerp(color, other.color, t) ?? color);
  }
}

class RejectButtonTheme extends ThemeExtension<RejectButtonTheme> {
  final Color backgroundColor;
  final Color textColor;

  RejectButtonTheme({
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  ThemeExtension<RejectButtonTheme> copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return RejectButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<RejectButtonTheme> lerp(covariant ThemeExtension<RejectButtonTheme>? other, double t) {
    if (other is! RejectButtonTheme) {
      return this;
    }
    return RejectButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
    );
  }
}

class ConfirmButtonTheme extends ThemeExtension<ConfirmButtonTheme> {
  final Color backgroundColor;
  final Color textColor;

  ConfirmButtonTheme({
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  ThemeExtension<ConfirmButtonTheme> copyWith({
    Color? backgroundColor,
    Color? textColor,
  }) {
    return ConfirmButtonTheme(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      textColor: textColor ?? this.textColor,
    );
  }

  @override
  ThemeExtension<ConfirmButtonTheme> lerp(covariant ThemeExtension<ConfirmButtonTheme>? other, double t) {
    if (other is! ConfirmButtonTheme) {
      return this;
    }
    return ConfirmButtonTheme(
      backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t) ?? backgroundColor,
      textColor: Color.lerp(textColor, other.textColor, t) ?? textColor,
    );
  }
}

class DoubleCircleChartTheme extends ThemeExtension<DoubleCircleChartTheme> {
  final Color firstValueTrackColor;
  final Color secondValueTrackColor;
  final Color firstValueTextColor;
  final Color secondValueTextColor;
  final Color firstValueProgressBarColor;
  final Color secondValueProgressBarColor;

  DoubleCircleChartTheme({
    required this.firstValueTrackColor,
    required this.secondValueTrackColor,
    required this.firstValueTextColor,
    required this.secondValueTextColor,
    required this.firstValueProgressBarColor,
    required this.secondValueProgressBarColor,
  });

  @override
  ThemeExtension<DoubleCircleChartTheme> copyWith({
    Color? firstValueTrackColor,
    Color? secondValueTrackColor,
    Color? firstValueTextColor,
    Color? secondValueTextColor,
    Color? firstValueProgressBarColor,
    Color? secondValueProgressBarColor,
  }) {
    return DoubleCircleChartTheme(
      firstValueTrackColor: firstValueTrackColor ?? this.firstValueTrackColor,
      secondValueTrackColor: secondValueTrackColor ?? this.secondValueTrackColor,
      firstValueTextColor: firstValueTextColor ?? this.firstValueTextColor,
      secondValueTextColor: secondValueTextColor ?? this.secondValueTextColor,
      firstValueProgressBarColor: firstValueProgressBarColor ?? this.firstValueProgressBarColor,
      secondValueProgressBarColor: secondValueProgressBarColor ?? this.secondValueProgressBarColor,
    );
  }

  @override
  ThemeExtension<DoubleCircleChartTheme> lerp(covariant ThemeExtension<DoubleCircleChartTheme>? other, double t) {
    if (other is! DoubleCircleChartTheme) {
      return this;
    }
    return DoubleCircleChartTheme(
      firstValueTrackColor: Color.lerp(firstValueTrackColor, other.firstValueTrackColor, t) ?? firstValueTrackColor,
      secondValueTrackColor: Color.lerp(secondValueTrackColor, other.secondValueTrackColor, t) ?? secondValueTrackColor,
      firstValueTextColor: Color.lerp(firstValueTextColor, other.firstValueTextColor, t) ?? firstValueTextColor,
      secondValueTextColor: Color.lerp(secondValueTextColor, other.secondValueTextColor, t) ?? secondValueTextColor,
      firstValueProgressBarColor:
          Color.lerp(firstValueProgressBarColor, other.firstValueProgressBarColor, t) ?? firstValueProgressBarColor,
      secondValueProgressBarColor:
          Color.lerp(secondValueProgressBarColor, other.secondValueProgressBarColor, t) ?? secondValueProgressBarColor,
    );
  }
}

class CardioLabelTheme extends ThemeExtension<CardioLabelTheme> {
  final Color imageColor;

  CardioLabelTheme({
    required this.imageColor,
  });

  @override
  ThemeExtension<CardioLabelTheme> copyWith({
    Color? imageColor,
  }) {
    return CardioLabelTheme(
      imageColor: imageColor ?? this.imageColor,
    );
  }

  @override
  ThemeExtension<CardioLabelTheme> lerp(covariant ThemeExtension<CardioLabelTheme>? other, double t) {
    if (other is! CardioLabelTheme) {
      return this;
    }
    return CardioLabelTheme(
      imageColor: Color.lerp(imageColor, other.imageColor, t) ?? imageColor,
    );
  }
}

class StepsLabelTheme extends ThemeExtension<StepsLabelTheme> {
  final Color imageColor;

  StepsLabelTheme({
    required this.imageColor,
  });

  @override
  ThemeExtension<StepsLabelTheme> copyWith({
    Color? imageColor,
  }) {
    return StepsLabelTheme(
      imageColor: imageColor ?? this.imageColor,
    );
  }

  @override
  ThemeExtension<StepsLabelTheme> lerp(covariant ThemeExtension<StepsLabelTheme>? other, double t) {
    if (other is! StepsLabelTheme) {
      return this;
    }
    return StepsLabelTheme(
      imageColor: Color.lerp(imageColor, other.imageColor, t) ?? imageColor,
    );
  }
}

class ProfileInfoBoxTheme extends ThemeExtension<ProfileInfoBoxTheme> {
  final Color borderActiveColor;
  final Color borderSelectedColor;
  final Color borderUnactiveColor;
  final Color contentActiveColor;
  final Color contentUnactiveColor;

  ProfileInfoBoxTheme({
    required this.borderActiveColor,
    required this.borderSelectedColor,
    required this.borderUnactiveColor,
    required this.contentActiveColor,
    required this.contentUnactiveColor,
  });

  @override
  ThemeExtension<ProfileInfoBoxTheme> copyWith() {
    throw UnimplementedError();
  }

  @override
  ThemeExtension<ProfileInfoBoxTheme> lerp(covariant ThemeExtension<ProfileInfoBoxTheme>? other, double t) {
    if (other is! ProfileInfoBoxTheme) {
      return this;
    }
    return ProfileInfoBoxTheme(
      borderActiveColor: Color.lerp(borderActiveColor, other.borderActiveColor, t) ?? borderActiveColor,
      borderSelectedColor: Color.lerp(borderSelectedColor, other.borderSelectedColor, t) ?? borderSelectedColor,
      borderUnactiveColor: Color.lerp(borderUnactiveColor, other.borderUnactiveColor, t) ?? borderUnactiveColor,
      contentActiveColor: Color.lerp(contentActiveColor, other.contentActiveColor, t) ?? contentActiveColor,
      contentUnactiveColor: Color.lerp(contentUnactiveColor, other.contentUnactiveColor, t) ?? contentUnactiveColor,
    );
  }
}
