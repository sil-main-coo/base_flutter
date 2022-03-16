import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2.dart';
import 'package:get/get.dart';

class Module2Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StateManager2>(() => StateManager2());
  }
}
