part of 'export.dart';

//w100 Thin, the least thick
//w200 Extra-light
//w300 Light
//w400 Normal / regular / plain
//w500 Medium
//w600 Semi-bold
//w700 Bold
//w800 Extra-bold
//w900 Black, the most thick

class AppTextTheme {
  static double fzLargeTitle = Dimens.space_34;
  static double fzTitle1 = Dimens.space_28;
  static double fzTitle2 = Dimens.space_22;
  static double fzTitle3 = Dimens.space_20;
  static double fzButton = Dimens.space_18;
  static double fzHeadline = Dimens.space_17;
  static double fzBody = Dimens.space_17;
  static double fzCallOut = Dimens.space_16;
  static double fzSubHead = Dimens.space_15;
  static double fzFootnote = Dimens.space_13;
  static double fzCaption1 = Dimens.space_12;
  static double fzCaption2 = Dimens.space_11;

  static TextTheme defaultTextTheme() {
    return TextTheme(
      headline1: TextStyle(
          fontSize: fzTitle1,
          fontWeight: FontWeight.w400,
          color: mPrimaryTextColor),
      headline2: TextStyle(
          fontSize: fzHeadline,
          fontWeight: FontWeight.w600,
          color: mPrimaryTextColor),
      subtitle1: TextStyle(
          fontSize: fzTitle2,
          fontWeight: FontWeight.w400,
          color: mPrimaryTextColor),
      subtitle2: TextStyle(
          fontSize: fzTitle3,
          fontWeight: FontWeight.w400,
          color: mPrimaryTextColor),
      bodyText1: TextStyle(
          fontSize: fzBody,
          fontWeight: FontWeight.w400,
          color: mPrimaryTextColor),
      bodyText2: TextStyle(
          fontSize: fzLargeTitle,
          fontWeight: FontWeight.bold,
          color: mPrimaryTextColor),
      button: TextStyle(
          fontSize: fzButton,
          fontWeight: FontWeight.w600,
          color: mTextWhiteColor),
      caption: TextStyle(
          fontSize: fzCaption1,
          fontWeight: FontWeight.w400,
          color: mPrimaryTextColor),
      overline: TextStyle(
          fontSize: fzCaption2,
          fontWeight: FontWeight.w400,
          color: mPrimaryTextColor),
    );
  }
}

/// Custom text theme
extension ThemeExtension on TextTheme {
  TextStyle get largeTitle => TextStyle(
      fontSize: AppTextTheme.fzLargeTitle,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get title1 => TextStyle(
      fontSize: AppTextTheme.fzTitle1,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get title2 => TextStyle(
      fontSize: AppTextTheme.fzTitle2,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get title3 => TextStyle(
      fontSize: AppTextTheme.fzTitle3,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get headline => TextStyle(
      fontSize: AppTextTheme.fzHeadline,
      fontWeight: FontWeight.w600,
      color: mPrimaryTextColor);

  TextStyle get body => TextStyle(
      fontSize: AppTextTheme.fzBody,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get callOut => TextStyle(
      fontSize: AppTextTheme.fzCallOut,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get subhead => TextStyle(
      fontSize: AppTextTheme.fzSubHead,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get footnote => TextStyle(
      fontSize: AppTextTheme.fzFootnote,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get caption1 => TextStyle(
      fontSize: AppTextTheme.fzCaption1,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get caption2 => TextStyle(
      fontSize: AppTextTheme.fzCaption2,
      fontWeight: FontWeight.w400,
      color: mPrimaryTextColor);

  TextStyle get errorTextField => TextStyle(
      fontSize: AppTextTheme.fzBody,
      fontWeight: FontWeight.normal,
      color: mBadTextColor);

  TextStyle get contentTextField => TextStyle(
      fontSize: AppTextTheme.fzBody,
      fontWeight: FontWeight.normal,
      color: mPrimaryTextColor);

  TextStyle get hintTextField =>
      contentTextField.copyWith(color: mPlaceholderColor);

  TextStyle get labelTextField => TextStyle(
      fontSize: AppTextTheme.fzCaption1,
      fontWeight: FontWeight.w600,
      color: mDescriptionColor);

  TextStyle get textAction => TextStyle(
      fontSize: AppTextTheme.fzButton,
      fontWeight: FontWeight.w600,
      color: mPrimaryTextColor);

  TextStyle get buttonDark => TextStyle(
      fontSize: AppTextTheme.fzButton,
      fontWeight: FontWeight.w600,
      color: mTextButtonDark);
}
