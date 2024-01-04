import 'package:stepel_flutter/imports.dart';

class Sizes {
  Sizes._();

  static const double spacingMin = 2;
  static const double spacingSmall = 4;
  static const double spacingHalf = 8;
  static const double spacingFull = 16;
  static const double spacingLarge = 32;

  static const double cornerRadius = 16;

  static const double welcomePageCardListHeight = 500;
  static const double welcomePageCardElevation = 3;
  static const double welcomePageDotIndicatorDotSize = 10;
  static const double welcomePageNextButtonHeight = 48;
  static const double welcomePageNextButtonWidth = 250;
  static const double authPageAppImageSize = 70;
  static const double permissionsPageIconSize = 50;
  static const double permissionsPageTopPaddingValue = 80;
  static const double homePageListBottomPaddingValue = 100;
  static const double homePageCustomCardHeight = 160;
  static const double jorunalPageListItemChartWidth = 6;
  static const double journalPageListItemChartSize = 110;
  static const double journalPageListItemSmallChartSize = 80;
  static const double profilePageInfoBoxHeight = 65;
  static const double profilePageInfoBoxWidth = 160;

  static const double doubleCircleBigChartSize = 180;
  static const double doubleCircleSmallChartSizeFactor = 0.8;
  static const double doubleCircleChartWidth = 8;
  static const double doubleCircleChartStartAngle = 270;
  static const double doubleCircleChartAngleRange = 360;
  static const double cardioLabelImageSize = 14;
  static const double stepsLabelImageSize = 14;
  static const double statisticLineWidht = 200;
  static const double appBarExpendedHeight = 120;
  static const double appBarExpandedTitleScaleFactor = 2;

  static const EdgeInsets welcomePageCardPadding = EdgeInsets.symmetric(horizontal: spacingFull);
  static const EdgeInsets authPagePadding = EdgeInsets.symmetric(horizontal: spacingHalf);
  static const EdgeInsets permissionsPagePadding =
      EdgeInsets.only(top: permissionsPageTopPaddingValue, right: spacingFull, left: spacingFull, bottom: spacingHalf);
  static const EdgeInsets homePageContentPadding = EdgeInsets.only(right: spacingHalf, left: spacingHalf);
  static const EdgeInsets homePageListBottomPadding = EdgeInsets.only(bottom: homePageListBottomPaddingValue);
  static const EdgeInsets appBarActionsPadding = EdgeInsets.only(right: spacingHalf);
  static const EdgeInsets homePageCustomCardPadding =
      EdgeInsets.only(top: spacingHalf, left: spacingMin, right: spacingMin);
  static const EdgeInsets homePageBoxInnerPadding = EdgeInsets.all(spacingFull);
  static const EdgeInsets homePageCategoryLabelPadding = EdgeInsets.only(left: spacingFull);
  static const EdgeInsets journalPageListItemPadding = EdgeInsets.only(bottom: spacingLarge);
  static const EdgeInsets journalPageListItemInnerPadding = EdgeInsets.only(left: spacingFull);

  static const BorderRadius borderRadius = BorderRadius.all(Radius.circular(cornerRadius));
}


// import 'package:stepel/imports.dart';

// class Sizes {
//   Sizes._();

//   static const double welcomePageNextButtonHeight = 48;
//   static const double welcomePageNextButtonWidth = 340;
//   static const double welcomePageCardHeight = 550;
//   static const double permissionsPageIconSize = 50;
//   static const double homePageBoxHeight = 130;
//   static const double homePageRecomendationBoxImageSize = 60;
//   static const double journalPageAppBarExpendedHeight = 120;
//   static const double jorunalPageListItemChartWidth = 6;
//   static const double journalPageListItemChartSize = 110;
//   static const double journalPageListItemSmallChartSize = 80;
//   static const double profilePageInfoBoxHeight = 65;
//   static const double profilePageInfoBoxWidth = 160;
//   static const double infoPageHeight = 400;

//   static const BorderRadius welcomePageBorderNextButtonBorderRadius = BorderRadius.all(Radius.circular(10));
//   static const BorderRadius homePageBoxBorderRadius = BorderRadius.all(Radius.circular(16));

//   static const EdgeInsets permissionsPagePadding = EdgeInsets.only(top: 80, right: 20, left: 20, bottom: 10);
//   static const EdgeInsets homePageContentPadding = EdgeInsets.only(top: 33, right: 16, left: 16);
//   static const EdgeInsets homePageListBottomPadding = EdgeInsets.only(bottom: 100);
//   static const EdgeInsets homePageBoxPadding = EdgeInsets.only(top: 15, left: 2, right: 2);
//   static const EdgeInsets homePageBoxInnerPadding = EdgeInsets.all(14);
//   static const EdgeInsets journalPageListItemPadding = EdgeInsets.only(bottom: 40);
//   static const EdgeInsets journalPageListItemInnerPadding = EdgeInsets.only(left: 16);
//   static const EdgeInsets infoPagePadding = EdgeInsets.symmetric(horizontal: 25);

//   static const EdgeInsets appBarActionsPadding = EdgeInsets.only(right: 16);
// }
