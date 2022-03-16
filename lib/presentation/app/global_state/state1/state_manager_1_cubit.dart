import 'package:base_flutter/commons/helpers/shared_prefs/shared_preferences_manager.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'state_manager_1_state.dart';

class StateManager1Cubit extends Cubit<StateManager1State> {
  StateManager1Cubit({required this.sharedPreferencesManager})
      : super(StateManager1Initial());
  final SharedPreferencesManager sharedPreferencesManager;

  String? value1;
  String? value2;

  void save() {
    sharedPreferencesManager.set('token', 'this is token');
  }

  String get() {
    return sharedPreferencesManager.get('token');
  }
}
