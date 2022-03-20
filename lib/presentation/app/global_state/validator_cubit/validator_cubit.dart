import 'package:base_flutter/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:base_flutter/commons/extentions/string_extension.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  int fieldsTotal;

  ValidatorCubit({this.fieldsTotal = 1})
      : super(const ValidatorChangedState.init()) {
    _errors = List.generate(fieldsTotal, (index) => '');
  }

  late List<String?> _errors;

  /// Method: validate user name
  void validateUserName(String value) {
    if (value.isEmpty) {
      emit(const ValidatorChangedState.init());
      return;
    }

    if (value.length >= 3) {
      emit(ValidatorChangedState.success(value: value));
      return;
    }

    emit(const ValidatorChangedState.failure(errors: ['Invalid user name']));
  }

  /// Method: validate input password field
  void validateInputPassword(String password) {
    if (!_isPassword(password)) {
      _errors[0] = 'Invalid pwd';
      emit(ValidatorChangedState.failure(errors: _errors));
      return;
    }
    emit(ValidatorChangedState.success(value: password));
  }

  bool _isPassword(String password) {
    return password.length >= 6;
  }
}
