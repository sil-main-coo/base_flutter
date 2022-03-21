import 'package:base_flutter/presentation/app/global_state/auth_cubit/auth_cubit.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'sign_out_state.dart';

class SignOutCubit extends Cubit<SignOutState> {
  SignOutCubit({required this.authCubit}) : super(SignOutInitial());

  final AuthCubit authCubit;

  Future signOut() async {
    // TODO: implement sign out
    emit(SignOutLoading());
    await Future.delayed(const Duration(seconds: 3));
    await authCubit.signedOut();
    emit(SignOutSuccess());
  }
}
