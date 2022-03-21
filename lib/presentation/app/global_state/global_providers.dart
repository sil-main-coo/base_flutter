import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/presentation/app/global_state/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/presentation/app/global_state/theme_cubit/theme_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Global providers
List<BlocProvider> get globalProviders => [
      BlocProvider<ThemeCubit>(create: (_) => getIt.get<ThemeCubit>()),
      BlocProvider<AuthCubit>(create: (_) => getIt.get<AuthCubit>()),
    ];
