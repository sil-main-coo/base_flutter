import 'package:get/get.dart';

import 'bindings/module2_binding.dart';
import 'page2/page2.dart';
import 'page3/page3.dart';

class Module2Route {
  static const page2 = '/page2';
  static const page3 = '/page3';

  static final pages = [
    GetPage(
      name: page2,
      binding: Module2Binding(),
      page: () => Page2(),
      children: [GetPage(name: page3, page: () => Page3())],
    ),
  ];
}
