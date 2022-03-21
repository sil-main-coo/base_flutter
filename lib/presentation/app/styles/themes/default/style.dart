part of 'export.dart';

class OverlayStyle {
  static Future getStyle() async {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: mStatusColor,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: mNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark));
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}
