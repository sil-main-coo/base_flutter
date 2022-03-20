import 'package:base_flutter/domain/models/auth/signin.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepository}) : super(SignInLoading());

  final AuthRepository authRepository;

  void signIn({required SignInRequest request}) async {
    try {
      final response = await authRepository.signIn(request);
      emit(SignInSuccess(signInResponse: response));
    } catch (e) {
      emit(const SignInFailure(msg: 'Login fail'));
    }
  }
}
