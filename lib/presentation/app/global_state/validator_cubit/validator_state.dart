part of 'validator_cubit.dart';

@immutable
abstract class ValidatorState extends Equatable {
  final bool isValid;
  final String? value;
  final List<String?>? errors;

  const ValidatorState({this.isValid = false, this.value, this.errors});

  @override
  List<Object> get props =>
      [isValid, if (value != null) value!, if (errors != null) errors!];
}

class ValidatorChangedState extends ValidatorState {
  const ValidatorChangedState.init()
      : super(
          isValid: false,
        );

  const ValidatorChangedState.success({String? value})
      : super(isValid: true, value: value, errors: const []);

  const ValidatorChangedState.failure(
      {String? value, List<String?>? errors, int? offset})
      : super(isValid: false, value: value, errors: errors);
}
