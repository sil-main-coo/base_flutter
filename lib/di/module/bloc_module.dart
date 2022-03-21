import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/presentation/app/global_state/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/presentation/app/global_state/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:base_flutter/presentation/journey/main/signout_cubit/sign_out_cubit.dart';

class BlocModule extends DIModule {
  @override
  provides() {
    /// Globals
    getIt.registerSingleton<ThemeCubit>(ThemeCubit());
    getIt.registerSingleton<AuthCubit>(AuthCubit(authRepository: getIt()));

    /// Internal
    getIt.registerFactory(
        () => SignInCubit(authRepository: getIt(), authCubit: getIt()));
    getIt.registerFactory(() => SignOutCubit(authCubit: getIt()));
  }
}
