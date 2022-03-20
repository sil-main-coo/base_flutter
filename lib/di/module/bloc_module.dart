import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/presentation/app/global_state/state1/state_manager_1_cubit.dart';
import 'package:base_flutter/presentation/app/global_state/theme_cubit/theme_cubit.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:base_flutter/presentation/journey/module2/state_manager/state_manager_2_cubit.dart';

class BlocModule extends DIModule {
  @override
  provides() {
    /// Globals
    getIt.registerSingleton<ThemeCubit>(ThemeCubit());
    getIt.registerSingleton<StateManager1Cubit>(
        StateManager1Cubit(sharedPreferencesManager: getIt()));

    /// Internal
    getIt.registerFactory(() => StateManager2Cubit());
    getIt.registerFactory(() => SignInCubit(authRepository: getIt()));
  }
}
