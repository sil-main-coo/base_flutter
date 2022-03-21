import 'dart:async';
import 'dart:io';
import 'package:base_flutter/commons/helpers/cubit_observer/simple_bloc_observer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/@core/network/http_overrides.dart';
import 'package:base_flutter/commons/constants/app_default_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'build_config.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZoned(() async {
      WidgetsFlutterBinding.ensureInitialized();

      /// Get flavor from native
      await const MethodChannel('flavor')
          .invokeMethod<String>('getFlavor')
          .then((String? flavor) async {
        BuildConfig.init(flavor: flavor);
      }).catchError((error) {});

      /// Init external service
      await onInitExternalService();

      /// Init session storage
      _onInitSessionStorage();

      /// Init local storage
      await onInitLocalStorage();

      /// DI
      await onInjection();

      HttpOverrides.global = MyHttpOverrides(); // use in run zone

      final app = await onCreate(); // return init widget
      final wrapMultiScreen = ScreenUtilInit(
        designSize: AppDefaultConstants.designSize,
        builder: () => app,
      );

      BlocOverrides.runZoned(
        () => runApp(wrapMultiScreen),
        blocObserver: CubitObserver(),
      );

      // ignore: deprecated_member_use
    }, onError: (Object obj, StackTrace stack) {
      if (kDebugMode) {
        print(obj);
        print(stack);
      }
    });
  }

  Future? onInjection();

  Future? onInitLocalStorage();

  void _onInitSessionStorage() {
    getIt.registerSingletonAsync(() => SharedPreferences.getInstance());
  }

  Future? onInitExternalService();

  FutureOr<Widget> onCreate();
}
