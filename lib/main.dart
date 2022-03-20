import 'dart:async';
import 'package:flutter/material.dart';

import '@core/environment/env.dart';
import 'di/injection/injection.dart';
import 'presentation/app/app.dart';
import 'presentation/app/styles/themes/dark/export.dart';

void main() {
  Main();
}

class Main extends Env {
  @override
  FutureOr<Widget> onCreate() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };

    await LightStyle.getStyle();

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
