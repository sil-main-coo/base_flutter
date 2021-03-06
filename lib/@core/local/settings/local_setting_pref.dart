import 'package:base_flutter/@core/di/di_module.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalSettingsPref {
  static const String keyFirstRun = 'key_first_run';
  static const String keyFirstSetupNotify = 'key_first_setup_notify';

  static bool isFirstTime() {
    final prefs = Get.find<SharedPreferences>();

    var isFirstTime = prefs.getBool(keyFirstRun);
    if (isFirstTime != null && !isFirstTime) {
      prefs.setBool(keyFirstRun, false);
      return false;
    } else {
      prefs.setBool(keyFirstRun, false);
      return true;
    }
  }

  static bool isFirstNotifySetting() {
    final prefs = Get.find<SharedPreferences>();

    var isFirstTime = prefs.getBool(keyFirstSetupNotify);
    if (isFirstTime != null && !isFirstTime) {
      prefs.setBool(keyFirstSetupNotify, false);
      return false;
    } else {
      prefs.setBool(keyFirstSetupNotify, false);
      return true;
    }
  }

  static void resetFirstNotifySetting() {
    Get.find<SharedPreferences>().setBool(keyFirstSetupNotify, true);
  }
}
