import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/commons/helpers/shared_prefs/shared_preferences_manager.dart';
import 'package:get/get.dart';

class LocalModule extends DIModule {
  @override
  provides() {
    Get.putAsync(()=> SharedPreferencesManager().init());
  }
}
