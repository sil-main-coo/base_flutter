import 'package:base_flutter/@core/route/route_define.dart';
import 'package:base_flutter/presentation/app/route/app_route.dart';
import 'package:base_flutter/presentation/journey/module1/page1.dart';

class Module1Route extends RouteDefine {
  static const page1 = AppRoute.initial;

  @override
  List<Path> initRoute(Object? arguments) {
    // final args = arguments == null ? null : arguments as Map;
    return [
      Path(name: page1, page: const Page1()),
    ];
  }
}
