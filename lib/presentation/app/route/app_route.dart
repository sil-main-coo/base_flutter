import 'package:base_flutter/presentation/journey/auth/auth_route.dart';
import 'package:base_flutter/presentation/journey/main/main_route.dart';
import 'package:base_flutter/presentation/journey/splash/splash_route.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static const initial = '/';

  static void generateRoute(
      Map<String?, WidgetBuilder?>? builders, RouteSettings settings) {
    SplashRoute().build(builders, settings);
    AuthRoute().build(builders, settings);
    MainRoute().build(builders, settings);
  }

  static MaterialPageRoute? materialPageRoute(RouteSettings settings) {
    final Map<String?, WidgetBuilder?>? routeBuilders =
        <String, WidgetBuilder>{};

    generateRoute(routeBuilders, settings);

    final Widget Function(BuildContext context)? routeBuilder =
        routeBuilders?[settings.name ?? ""];

    return MaterialPageRoute(
        builder: (context) => routeBuilder!(context),
        settings: RouteSettings(name: settings.name));
  }
}
