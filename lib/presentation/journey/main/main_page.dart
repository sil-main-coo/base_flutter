import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/presentation/app/global_state/auth_cubit/auth_cubit.dart';
import 'package:base_flutter/presentation/components/buttons/gradient_button.dart';
import 'package:base_flutter/presentation/components/dialogs/loader_dialog.dart';
import 'package:base_flutter/presentation/components/layouts/compact_layout.dart';
import 'package:base_flutter/presentation/components/spaces/vertical_space_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'signout_cubit/sign_out_cubit.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  void _signOut(BuildContext context) {
    context.read<SignOutCubit>().signOut();
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthCubit>().state as Authenticated;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main page'),
      ),
      body: BlocListener<SignOutCubit, SignOutState>(
        listener: (context, state) {
          if (state is SignOutLoading) {
            getIt.get<LoaderDialog>().showDefault(context);
          }
          if(state is SignOutSuccess){
            getIt.get<LoaderDialog>().popDialog();
          }
        },
        child: CompactLayout(
          disableScroll: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('This is main body'),
              VSpace.init16(),
              Text(
                'Access token value: `${authState.token}`',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              VSpace.init32(),
              GradientButton(
                label: 'Sign out',
                onPressed: () => _signOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
