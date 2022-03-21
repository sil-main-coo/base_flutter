import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/@core/route/route_define.dart';
import 'package:base_flutter/presentation/journey/main/signout_cubit/sign_out_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_page.dart';

class MainRoute extends RouteDefine {
  static const main = '/main';

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
            name: main,
            page: const MainPage(),
            providers: (context) =>
                [BlocProvider<SignOutCubit>(create: (_) => getIt.get<SignOutCubit>())])
      ];
}
