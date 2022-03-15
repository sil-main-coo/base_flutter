import 'package:get/get.dart';

import 'bindings/module2_binding.dart';
import 'page2.dart';
import 'page3/page3.dart';

class Module2Route {
  static const PAGE2 = '/page2';
  static const PAGE3 = '/page3';

  static final pages = [
    GetPage(
      name: PAGE2,
      binding: Module2Binding(),
      page: () => Page2(),
      children: [GetPage(name: PAGE3, page: () => Page3())],
    ),
  ];
}
