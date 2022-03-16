import 'package:base_flutter/presentation/journey/module1/module1_route.dart';
import 'package:base_flutter/presentation/journey/module2/module2_route.dart';
import 'package:flutter/material.dart';

class AppRoute{
  static const initial = '/';

  static void generateRoute(
      Map<String?, WidgetBuilder?>? builders, RouteSettings settings) {
    Module1Route().build(builders, settings);
    Module2Route().build(builders, settings);
  }

  static MaterialPageRoute? materialPageRoute(RouteSettings settings) {
    final Map<String?, WidgetBuilder?>? routeBuilders = <String, WidgetBuilder>{};

    generateRoute(routeBuilders, settings);

    final Widget Function(BuildContext context)? routeBuilder =
    routeBuilders?[settings.name ?? ""];

    return MaterialPageRoute(
        builder: (context) => routeBuilder!(context),
        settings: RouteSettings(name: settings.name));
  }
}



