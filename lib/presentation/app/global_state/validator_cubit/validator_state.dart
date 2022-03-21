part of 'validator_cubit.dart';

abstract class ValidatorState extends Equatable {
  final String? value;
  final Map<Validator, String?>? errors;
  final bool initFlag;

  const ValidatorState({this.value, this.errors, this.initFlag = false});

  bool isValid() {
    if (initFlag) return false;

    if (errors != null) {
      for (var v in errors!.values) {
        if (v != null) {
          return false;
        }
      }
    }

    return true;
  }

  @override
  List<Object> get props =>
      [if (value != null) value!, if (errors != null) errors!, initFlag];
}

class ValidatorChangedState extends ValidatorState {
  const ValidatorChangedState.init(
      {String? value, Map<Validator, String?>? errors})
      : super(value: value, errors: errors, initFlag: true);

  const ValidatorChangedState.success(
      {String? value, Map<Validator, String?>? errors})
      : super(value: value, errors: errors);

  const ValidatorChangedState.failure(
      {String? value, required Map<Validator, String?> errors})
      : super(value: value, errors: errors);
}
