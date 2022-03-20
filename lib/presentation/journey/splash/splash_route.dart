import 'package:base_flutter/@core/route/route_define.dart';
import 'package:base_flutter/presentation/app/route/app_route.dart';

import 'splash_page.dart';

class SplashRoute extends RouteDefine {
  @override
  List<Path> initRoute(Object? arguments) => [
        Path(name: AppRoute.initial, page: const SplashScreen()),
      ];
}
