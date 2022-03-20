import 'package:base_flutter/@core/di/di_module.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SessionPref {
  static const String keyAccessToken = 'key_accessToken';
  static const String keyRefreshToken = 'key_refresh_Token';
  static const String keyUserName = 'key_user_name';

  static void saveSession(
      {required String accessToken,
      required String refreshToken}) {
    var preferencesManager = getIt.get<SharedPreferences>();
    preferencesManager.setString(keyAccessToken, accessToken);
    preferencesManager.setString(keyRefreshToken, refreshToken);
  }

  static String? getUserName() =>
      getIt.get<SharedPreferences>().getString(keyUserName);

  static String? getAccessToken() =>
      getIt.get<SharedPreferences>().getString(keyAccessToken);

  static String? getRefreshToken() =>
      getIt.get<SharedPreferences>().getString(keyRefreshToken);

  static bool isSessionValid() {
    try {
      return getIt.get<SharedPreferences>()
              .getString(keyAccessToken)
              ?.isNotEmpty ==
          true;
    } catch (e) {
      return false;
    }
  }

  static Future<void> removeUserName() async {
    // await getIt.get<SharedPreferencesManager>().clear();
    final prefs = getIt.get<SharedPreferences>();

    await prefs.remove(keyUserName);
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static Future<void> removeTokenUserData() async {
    final prefs = getIt.get<SharedPreferences>();
    await prefs.remove(keyAccessToken);
    await prefs.remove(keyRefreshToken);
  }

  static Future<void> clearSessionData() async {
    // await getIt.get<SharedPreferencesManager>().clear();
    await removeTokenUserData();
    await removeUserName();
  }
}
