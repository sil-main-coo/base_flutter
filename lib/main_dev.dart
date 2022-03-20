import 'dart:async';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';

import '@core/environment/env.dart';
import 'package:flutter/material.dart';

import 'di/injection/injection.dart';
import 'presentation/app/app.dart';
import 'presentation/app/styles/themes/default/export.dart';

void main() {
  Main();
}

class Main extends Env {
  final _devicePreview = false;

  @override
  FutureOr<Widget> onCreate() async {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };


    await LightStyle.getStyle();

    return _devicePreview
        ? DevicePreview(
            // enabled: !kReleaseMode,
            enabled: false,
            builder: (context) => const Application(
              title: 'Base Stag',
              locale: 'vi',
            ),
          )
        : const Application(
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
