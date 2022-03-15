part of style;

//w100 Thin, the least thick
//w200 Extra-light
//w300 Light
//w400 Normal / regular / plain
//w500 Medium
//w600 Semi-bold
//w700 Bold
//w800 Extra-bold
//w900 Black, the most thick

class AppThemes {
  static ThemeData defaultTheme() {
    return ThemeData(
      // Define the default brightness and colors.
      primaryColor: mAccentColor,
      accentColor: mAccentColor,
      scaffoldBackgroundColor: mColorBackground,

      appBarTheme: AppBarTheme(
        elevation: dimen_0,
        iconTheme: IconThemeData(color: mColorBodyText),
      ),
      buttonTheme: ButtonThemeData(
        height: 44.h,
        padding: EdgeInsets.symmetric(vertical: 8),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dimen_4)),
        textTheme:
            ButtonTextTheme.primary, //  <-- this auto selects the right color
      ),
      textTheme: TextTheme(
          // todo: apply
          ),
    );
  }
}

extension ThemeExtension on TextTheme {
  TextStyle get textTitleBodySize => TextStyle(
      fontSize: fzBody.sp,
      fontWeight: FontWeight.w600,
      color: mColorBodyText,
      letterSpacing: dimen_0_2);
}
