part of 'export.dart';

class LightStyle {
  static Future getStyle() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: DarkColor.mStatusColor,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: DarkColor.mNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.light));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
