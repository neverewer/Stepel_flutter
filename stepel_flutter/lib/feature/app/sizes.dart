import 'package:stepel_flutter/imports.dart';

class Sizes {
  Sizes._();

  static const double spacingMin = 2;
  static const double spacingSmall = 4;
  static const double spacingHalf = 8;
  static const double spacingFull = 16;
  static const double spacingLarge = 32;

  static const double blurRadius = 32;
  static const double cornerRadius = 16;

  static const double welcomePageCardListHeight = 500;
  static const double welcomePageCardElevation = 3;
  static const double welcomePageDotIndicatorDotSize = 10;
  static const double welcomePageNextButtonHeight = 48;
  static const double welcomePageNextButtonWidth = 250;

  static const EdgeInsets welcomePageCardPadding = EdgeInsets.symmetric(horizontal: spacingFull);

  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(cornerRadius));
}
