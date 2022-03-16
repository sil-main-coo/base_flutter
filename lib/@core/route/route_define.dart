import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class RouteDefine {
  build(Map<String?, WidgetBuilder?>? routeBuilders, RouteSettings settings) {
    initRoute(settings.arguments).forEach((element) {
      routeBuilders?.addAll(element.path());
    });
  }

  List<Path> initRoute(Object? arguments);
}

class Path {
  String name;
  List<BlocProvider> Function(BuildContext context)? providers;
  Widget page;


  Path({required this.name, required this.page, this.providers});

  Map<String, WidgetBuilder> path() => {
        name: (context) => providers == null
            ? page
            : MultiBlocProvider(providers: providers!(context), child: page)
      };
}