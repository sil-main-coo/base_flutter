part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  final String token;
  final bool autoPush;

  const Authenticated({required this.token, this.autoPush = false});

  @override
  List<Object> get props => [token, autoPush];
}

class UnAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class SignedOutFailed extends AuthState {
  final Exception exception;

  const SignedOutFailed({required this.exception});

  SignedOutFailed copyWith({Exception? exception}) {
    return SignedOutFailed(exception: exception ?? this.exception);
  }

  @override
  List<Object> get props => [exception];
}

class AuthenticatedFailed extends AuthState {
  final Exception exception;

  const AuthenticatedFailed({required this.exception});

  AuthenticatedFailed copyWith({Exception? exception}) {
    return AuthenticatedFailed(exception: exception ?? this.exception);
  }

  @override
  List<Object> get props => [exception];
}
