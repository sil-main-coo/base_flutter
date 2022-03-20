import 'package:base_flutter/domain/models/auth/signin.dart';

abstract class AuthRepository {
  Future<SignInResponse> signIn(SignInRequest request);

  bool signOut();
}
