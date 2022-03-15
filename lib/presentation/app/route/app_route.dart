import 'package:base_flutter/presentation/journey/module1/page1.dart';
import 'package:base_flutter/presentation/journey/module2/module2_route.dart';
import 'package:get/get.dart';
class AppRoute{
  static const INITIAL = '/';

  static final pages = [
    GetPage(
      name: INITIAL,
      page: () => Page1(),
    ),
    ...Module2Route.pages
  ];
}