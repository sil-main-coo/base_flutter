import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  late SharedPreferences sharedPreferences;

  Future<SharedPreferencesManager> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> set(String key, dynamic value) {
    assert(
      value is bool ||
          value is double ||
          value is int ||
          value is String ||
          value is List<String>,
      'Unsupported type',
    );

    final Map<Type, Function> typeResolvers = {
      bool: sharedPreferences.setBool,
      double: sharedPreferences.setDouble,
      int: sharedPreferences.setInt,
      String: sharedPreferences.setString,
      List: sharedPreferences.setStringList
    };

    return typeResolvers[value.runtimeType]!(key, value);
  }

  Future<bool> setStringFromMap(String key, Map map) async {
    final result  = await sharedPreferences.setString(key, jsonEncode(map));
    return result;
  }

  Map? getMapFromString(String key) {
    String? data = sharedPreferences.getString(key);

    if (data != null) {
      return jsonDecode(data);
    }
    return null;
  }

  dynamic get(String key) => sharedPreferences.get(key);

  Future<bool> remove(String key) => sharedPreferences.remove(key);

  Future? clear() => sharedPreferences.clear();
}
