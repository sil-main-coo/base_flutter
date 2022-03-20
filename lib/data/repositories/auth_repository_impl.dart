import 'package:base_flutter/@core/local/sessions/sessions_pref.dart';
import 'package:base_flutter/data/sources/remote/auth/auth_remote_source.dart';
import 'package:base_flutter/domain/models/auth/signin.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({required this.authRemoteSource});

  final AuthRemoteSource authRemoteSource;

  @override
  Future<SignInResponse> signIn(SignInRequest request) async {
    final response = await authRemoteSource.signIn(request);
    SessionPref.saveSession(
        accessToken: response.accessToken ?? '',
        refreshToken: response.refreshToken ?? '');
    return response;
  }

  @override
  bool signOut() {
    SessionPref.clearSessionData();
    return true;
  }
}
