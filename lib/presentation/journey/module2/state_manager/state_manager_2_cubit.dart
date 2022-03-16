import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state_manager_2_state.dart';

class StateManager2Cubit extends Cubit<StateManager2State> {
  StateManager2Cubit() : super(StateManager2Initial());

  String? value1;
  String? value2;
}
