import 'package:base_flutter/domain/models/auth/signin.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';
import 'package:base_flutter/presentation/app/global_state/auth_cubit/auth_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepository, required this.authCubit})
      : super(SignInInitial());

  final AuthRepository authRepository;
  final AuthCubit authCubit;

  void signIn({required SignInRequest request}) async {
    emit(SignInLoading());
    try {
      final response = await authRepository.signIn(request);
      authCubit.signedIn(response);
      emit(SignInSuccess(signInResponse: response));
    } catch (e) {
      emit(const SignInFailure(msg: 'Login fail'));
    }
  }
}
