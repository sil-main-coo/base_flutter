import 'package:base_flutter/domain/models/auth/signin.dart';
import 'package:base_flutter/presentation/app/global_state/validator_cubit/validator_cubit.dart';
import 'package:base_flutter/presentation/app/global_state/validator_cubit/validator_enum.dart';
import 'package:base_flutter/presentation/components/buttons/gradient_button.dart';
import 'package:base_flutter/presentation/components/spaces/vertical_space_widget.dart';
import 'package:base_flutter/presentation/components/textfields/app_textfield.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key, required this.onSubmit, required this.onFailure})
      : super(key: key);

  final Function(SignInCubit signInCubit, SignInRequest request) onSubmit;
  final Function(SignInFailure state) onFailure;

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
      child: BlocBuilder<ValidatorCubit, ValidatorState>(
        builder: (context, state) => Column(
          children: [
            AppTextField(
                controller: _userNameCtrl,
                labelText: 'User name',
                hintText: 'Enter user name...',
                prefixIcon: const Icon(Icons.person),
                errorText: state.errors != null &&
                        state.errors![Validator.userName] != null
                    ? state.errors![Validator.userName]
                    : null,
                onChanged: context.read<ValidatorCubit>().validateUsername),
            VSpace.init8(),
            AppTextField(
                controller: _passwordCtrl,
                labelText: 'Password',
                hintText: 'Enter password...',
                obscureText: true,
                prefixIcon: const Icon(Icons.password),
                errorText: state.errors != null &&
                        state.errors![Validator.password] != null
                    ? state.errors![Validator.password]
                    : null,
                onChanged: context.read<ValidatorCubit>().validatePassword),
            VSpace.init24(),
            _buildButton(state.isValid())
          ],
        ),
      ),
    );
  }

  Widget _buildButton(bool isValid) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) {
        if (state is SignInFailure) {
          widget.onFailure(state);
        }
      },
      builder: (context, state) {
        return (state is SignInLoading)
            ? const GradientButton.loading()
            : GradientButton(
                onPressed: isValid
                    ? () => widget.onSubmit(
                          context.read<SignInCubit>(),
                          SignInRequest(
                              userName: _userNameCtrl.text.trim(),
                              password: _passwordCtrl.text.trim()),
                        )
                    : null,
                label: 'Sign In',
              );
      },
    );
  }
}
