import 'package:base_flutter/domain/models/auth/signin.dart';
import 'package:base_flutter/presentation/components/dialogs/action_dialogs.dart';
import 'package:base_flutter/presentation/components/layouts/compact_layout.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/presentation/app/styles/domain/export.dart';

import 'widget/sign_in_form.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  void _onSubmit(SignInCubit signInCubit, SignInRequest request) {
    signInCubit.signIn(request: request);
  }

  void _onFailure(BuildContext context, SignInFailure state) {
    ActionDialogs.show(
        context: context,
        message: state.msg,
        rightLabel: 'OK',
        callBackRight: () => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: Theme.of(context).textTheme.title2,
        ),
      ),
      body: CompactLayout(
        child: SignInForm(
          onSubmit: _onSubmit,
          onFailure: (state) => _onFailure(context, state),
        ),
      ),
    );
  }
}
