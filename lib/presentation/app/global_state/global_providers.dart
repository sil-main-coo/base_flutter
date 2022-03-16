import 'package:base_flutter/@core/di/di_module.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'state1/state_manager_1_cubit.dart';

/// Global providers
List<BlocProvider> get globalProviders => [
      BlocProvider<StateManager1Cubit>(
          create: (_) => getIt.get<StateManager1Cubit>()),
    ];
