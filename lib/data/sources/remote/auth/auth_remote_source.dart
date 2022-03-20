import 'package:base_flutter/domain/models/auth/signin.dart';

class AuthRemoteSource {
  Future<SignInResponse> signIn(SignInRequest request) async {
    await Future.delayed(const Duration(seconds: 3));
    return SignInResponse.fromJson({
      "id": 1,
      "fullName": 'Trương Việt Hoàng',
      "accessToken": 'This is access token',
      "refreshToken": 'This is refresh token'
    });
  }
}
