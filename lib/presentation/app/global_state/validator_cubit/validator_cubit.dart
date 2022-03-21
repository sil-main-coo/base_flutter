import 'package:base_flutter/generated/l10n.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'validator_enum.dart';
import 'package:base_flutter/commons/extentions/string_extension.dart';

part 'validator_state.dart';

class ValidatorCubit extends Cubit<ValidatorState> {
  ValidatorCubit({required this.keys})
      : super(const ValidatorChangedState.init()) {
    _errors = {};
    for (var element in keys) {
      _errors[element] = '';
    }
    emit(ValidatorChangedState.init(errors: _errors));
  }

  final List<Validator> keys;
  late Map<Validator, String?> _errors;

  void _emitSuccess(Validator key, String value) {
    emit(ValidatorChangedState.success(
        value: value, errors: _errors..[key] = null));
  }

  void _emitFailure(Validator key, String message, [String? value]) {
    _errors[key] = message;
    emit(ValidatorChangedState.failure(errors: _errors, value: value));
  }

  /// Method: validate input username field
  void validateUsername(String username) {
    if (username.length < 4) {
      _emitFailure(Validator.userName, 'Invalid user name');
      return;
    }
    _emitSuccess(Validator.userName, username);
  }

  /// Method: validate input password field
  void validatePassword(String password) {
    if (!_isPassword(password)) {
      _emitFailure(Validator.password, 'Invalid password');
      return;
    }
    _emitSuccess(Validator.password, password);
  }

  bool _isPassword(String password) {
    return password.length >= 6;
  }
}
