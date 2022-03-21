import 'package:base_flutter/@core/local/sessions/sessions_pref.dart';
import 'package:base_flutter/domain/models/auth/signin.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;

  void checkAuth() {
    emit(AuthLoading());
    final token = SessionPref.getAccessToken();

    if (token == null) {
      emit(UnAuthenticated());
      return;
    }

    emit(Authenticated(token: token, autoPush: true));
  }

  void signedIn(SignInResponse response) {
    emit(Authenticated(token: response.accessToken!, autoPush: true));
  }

  Future signedOut() async {
    emit(AuthLoading());
    authRepository.signOut();
    emit(UnAuthenticated());
  }
}
