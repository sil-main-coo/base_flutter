import 'package:base_flutter/presentation/app/global_state/global_state.dart';
import 'package:get/get.dart';

class AppBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StateManager1>(
        () => StateManager1(sharedPreferencesManager: Get.find()));
  }
}
