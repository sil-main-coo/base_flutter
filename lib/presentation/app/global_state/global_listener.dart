import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/generated/l10n.dart';
import 'package:base_flutter/presentation/app/app.dart';
import 'package:base_flutter/presentation/components/dialogs/action_dialogs.dart';
import 'package:base_flutter/presentation/components/dialogs/loader_dialog.dart';
import 'package:base_flutter/presentation/journey/auth/sign_in_route.dart';
import 'package:base_flutter/presentation/journey/main/main_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_cubit/auth_cubit.dart';

/// Global listener
List<BlocListener> get globalListeners => [
      /// Auth listener
      BlocListener<AuthCubit, AuthState>(listener: (context, state) {
        switch (state.runtimeType) {
          case Authenticated:
            if ((state as Authenticated).autoPush) {
              Application.navigator.pushReplacementNamed(
                MainRoute.main,
              );
            }
            return;
          case UnAuthenticated:
            getIt.get<LoaderDialog>().popDialog();
            Application.navigator.pushNamedAndRemoveUntil(
              AuthRoute.signIn,
              (route) => false,
            );
            return;
          case AuthenticatedFailed:
            getIt.get<LoaderDialog>().popDialog();
            ActionDialogs.show(
                context: Application.globalContext,
                barrierDismissible: false,
                title: S.current.error,
                message: (state as AuthenticatedFailed).exception.toString(),
                rightLabel: S.current.tryAgain,
                callBackRight: () => Application.navigator.pop(context));
            return;
          default:
            getIt.get<LoaderDialog>().showDefault(Application.globalContext);
            return;
        }
      })
    ];
