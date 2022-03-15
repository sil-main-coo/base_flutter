import 'dart:async';
import 'package:dio/dio.dart';
import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/@core/environment/build_config.dart';
import 'package:base_flutter/@core/network/interceptor/auth_interceptor.dart';
import 'package:base_flutter/@core/network/interceptor/token_interceptor.dart';
import 'package:get/get.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await setup();
    Get.put(()=> dio);
    // register api
    // Get.lazyPut(
    //     () => AccountRemoteSource(dio, baseUrl: dio.options.baseUrl));
  }

  static FutureOr<Dio> setup() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get()?.connectTimeout,
      receiveTimeout: BuildConfig.get()?.receiveTimeout,
      responseType: ResponseType.json,
      sendTimeout: 5000,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "",
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    /// Adapt data (according to your own data structure, you can choose to add it)
    dio.interceptors.add(TokenInterceptor());

    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dio.interceptors.add(
          LogInterceptor(requestBody: true, responseBody: true, error: true));
    }
    return dio;
  }
}
