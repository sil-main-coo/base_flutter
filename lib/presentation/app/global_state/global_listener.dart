import 'package:flutter_bloc/flutter_bloc.dart';

import 'state1/state_manager_1_cubit.dart';

/// Global listener
List<BlocListener> get globalListeners => [
      BlocListener<StateManager1Cubit, StateManager1State>(
          listener: (context, state) {}),
    ];
