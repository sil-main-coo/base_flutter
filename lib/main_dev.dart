import 'dart:async';
import '@core/environment/env.dart';
import 'package:flutter/material.dart';

import 'di/injection/injection.dart';
import 'presentation/app/app.dart';
import 'presentation/app/styles/style.dart';

void main() {
  Main();
}

class Main extends Env {
  @override
  FutureOr<StatelessWidget> onCreate() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };

    await Style.styleDefault();

    return const Application(
      title: 'Base Stag',
      locale: 'vi',
    );
  }

  @override
  Future? onInitExternalService() => null;

  @override
  Future? onInjection() => Injection.inject();

  @override
  Future? onInitLocalStorage() => null;
}
