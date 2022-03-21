part of 'sign_in_cubit.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInLoading extends SignInState {
  @override
  List<Object?> get props => [];
}

class SignInFailure extends SignInState {
  final String msg;

  const SignInFailure({required this.msg});

  @override
  List<Object> get props => [msg];
}

class SignInSuccess extends SignInState {
  final SignInResponse signInResponse;

  const SignInSuccess({required this.signInResponse});

  @override
  List<Object?> get props => [signInResponse];
}
