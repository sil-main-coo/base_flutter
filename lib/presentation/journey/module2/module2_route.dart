import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/@core/route/route_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'page2/page2.dart';
import 'page3/page3.dart';
import 'state_manager/state_manager_2_cubit.dart';

class Module2Route extends RouteDefine {
  static const page2 = '/page2';
  static const page3 = '/page3';

  @override
  List<Path> initRoute(Object? arguments) {
    // final args = arguments == null ? null : arguments as Map;
    return [
      Path(
        name: page2,
        providers: (context) => [
          BlocProvider<StateManager2Cubit>(
            create: (_) => getIt.get<StateManager2Cubit>(),
          ),
        ],
        page: const Page2(),
      ),
      Path(name: page3, page: const Page3()),
    ];
  }
}
