import 'package:base_flutter/presentation/components/buttons/gradient_button.dart';
import 'package:base_flutter/presentation/components/spaces/vertical_space_widget.dart';
import 'package:base_flutter/presentation/components/textfields/app_textfield.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _userNameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userNameCtrl.dispose();
    _passwordCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          return Column(
            children: [
              AppTextField(
                controller: _userNameCtrl,
                labelText: 'User name',
                hintText: 'Enter user name...',
                prefixIcon: const Icon(Icons.person),
              ),
              VSpace.init8(),
              AppTextField(
                controller: _passwordCtrl,
                labelText: 'User name',
                hintText: 'Enter user name...',
                obscureText: true,
              ),
              VSpace.init24(),
              const GradientButton.loading()
            ],
          );
        },
      ),
    );
  }
}
