part of style;

class Style {
  static Future styleDefault() async{
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: mStatusColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: mColorNavigationBar,
        systemNavigationBarIconBrightness: Brightness.dark));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
