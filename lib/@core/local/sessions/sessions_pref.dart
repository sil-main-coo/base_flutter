import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SessionPref {
  static const String keyAccessToken = 'key_accessToken';
  static const String keyRefreshToken = 'key_refresh_Token';
  static const String keyUserName = 'key_user_name';

  static void saveSession(
      {required String accessToken,
      required String refreshToken,
      required String userName}) {
    var preferencesManager = Get.find<SharedPreferences>();
    preferencesManager.setString(keyAccessToken, accessToken);
    preferencesManager.setString(keyRefreshToken, refreshToken);
    preferencesManager.setString(keyUserName, userName);
  }

  static String? getUserName() =>
      Get.find<SharedPreferences>().getString(keyUserName);

  static String? getAccessToken() =>
      Get.find<SharedPreferences>().getString(keyAccessToken);

  static String? getRefreshToken() =>
      Get.find<SharedPreferences>().getString(keyRefreshToken);

  static bool isSessionValid() {
    try {
      return Get.find<SharedPreferences>()
              .getString(keyAccessToken)
              ?.isNotEmpty ==
          true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> removeUserName() async {
    // await getIt.get<SharedPreferencesManager>().clear();
    final prefs = Get.find<SharedPreferences>();

    await prefs.remove(keyUserName);
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static Future<void> removeTokenUserData() async {
    final prefs = Get.find<SharedPreferences>();
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static Future<void> clearSessionData() async {
    // await getIt.get<SharedPreferencesManager>().clear();
    await removeTokenUserData();
    await removeUserName();
  }
}
