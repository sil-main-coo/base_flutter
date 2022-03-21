import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/@core/route/route_define.dart';
import 'package:base_flutter/presentation/app/global_state/validator_cubit/validator_cubit.dart';
import 'package:base_flutter/presentation/app/global_state/validator_cubit/validator_enum.dart';
import 'package:base_flutter/presentation/journey/auth/forgot_password/forgot_password_page.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'sign_in/sign_in_page.dart';
import 'sign_up/sign_up_page.dart';

class AuthRoute extends RouteDefine {
  static const signIn = '/signIn';
  static const signUp = '/signUp';
  static const forgotPassword = '/forgotPassword';

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
            name: signIn,
            page: const SignInPage(),
            providers: (context) => [
                  BlocProvider<SignInCubit>(
                      create: (_) => getIt.get<SignInCubit>()),
                  BlocProvider<ValidatorCubit>(
                      create: (_) => ValidatorCubit(
                          keys: [Validator.userName, Validator.password])),
                ]),
        Path(name: signUp, page: const SignUpPage()),
        Path(name: forgotPassword, page: const ForgotPasswordPage()),
      ];
}
