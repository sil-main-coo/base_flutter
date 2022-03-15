import 'package:base_flutter/commons/helpers/shared_prefs/shared_preferences_manager.dart';

class StateManager1 {
  String? value1;
  String? value2;

  final SharedPreferencesManager sharedPreferencesManager;

  StateManager1({required this.sharedPreferencesManager});

  void save() {
    sharedPreferencesManager.set('token', 'this is token');
  }

  String get() {
    return sharedPreferencesManager.get('token');
  }
}
