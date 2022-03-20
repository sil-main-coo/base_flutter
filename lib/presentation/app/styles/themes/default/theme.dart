part of 'export.dart';

class AppLightThemes {
  static ThemeData getTheme() {
    return ThemeData(
      primaryColor: mPrimaryColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      appBarTheme: AppBarTheme(
        elevation: Dimens.zero,
        iconTheme: IconThemeData(color: mPrimaryIconColor),
      ),
      buttonTheme: ButtonThemeData(
        height: Dimens.btn_height,
        padding: EdgeInsets.symmetric(
            vertical: Dimens.height_8, horizontal: Dimens.width_8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Dimens.radius_4)),
        textTheme: ButtonTextTheme.primary,
      ),
      textTheme: AppTextTheme.defaultTextTheme(),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: mAccentColor),
    );
  }
}
