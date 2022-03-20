part of 'export.dart';

class AppDarkThemes {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: DarkColor.mPrimaryColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: DarkColor.scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: Dimens.zero,
        iconTheme: IconThemeData(color: DarkColor.mPrimaryIconColor),
      ),
      buttonTheme: ButtonThemeData(
        height: Dimens.btn_height,
        padding: EdgeInsets.symmetric(vertical: Dimens.height_8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius_4)),
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: AppTextTheme.defaultTextTheme(),
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: DarkColor.mAccentColor),
    );
  }
}
