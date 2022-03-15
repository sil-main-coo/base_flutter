import 'package:flutter/material.dart';
import 'package:base_flutter/@core/logging/logging.dart';
import 'package:base_flutter/commons/constants/app_default_constants.dart';
import 'package:logging/logging.dart';
import 'package:base_flutter/commons/extentions/extension.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum Flavor { DEVELOPMENT, STAGING, PREPROD, RELEASE }

class BuildConfig {
  const BuildConfig._(
      {required this.baseUrl,
      required this.socketUrl,
      required this.connectTimeout,
      required this.receiveTimeout,
      required this.flavor,
      this.color = Colors.blue});

  const BuildConfig._development()
      : this._(
          baseUrl: AppDefaultConstants.baseUrl,
          socketUrl: AppDefaultConstants.socketUrl,
          connectTimeout: AppDefaultConstants.connectTimeout,
          receiveTimeout: AppDefaultConstants.receiveTimeout,
          flavor: Flavor.DEVELOPMENT,
        );

  const BuildConfig._staging()
      : this._(
            baseUrl: AppDefaultConstants.baseUrl,
            socketUrl: AppDefaultConstants.socketUrl,
            connectTimeout: AppDefaultConstants.connectTimeout,
            receiveTimeout: AppDefaultConstants.receiveTimeout,
            flavor: Flavor.STAGING);

  const BuildConfig._preprod()
      : this._(
            baseUrl: AppDefaultConstants.baseUrl,
            socketUrl: AppDefaultConstants.socketUrl,
            connectTimeout: AppDefaultConstants.connectTimeout,
            receiveTimeout: AppDefaultConstants.receiveTimeout,
            flavor: Flavor.PREPROD);

  const BuildConfig._release()
      : this._(
            baseUrl: AppDefaultConstants.baseUrl,
            socketUrl: AppDefaultConstants.socketUrl,
            connectTimeout: AppDefaultConstants.connectTimeout,
            receiveTimeout: AppDefaultConstants.receiveTimeout,
            flavor: Flavor.RELEASE);

  static BuildConfig? _instance;

  static init({flavor}) async {
    if (_instance == null) {
      debugPrint(
          '╔══════════════════════════════════════════════════════════════╗');
      debugPrint(
          '                    Build Flavor: $flavor                       ');
      debugPrint(
          '╚══════════════════════════════════════════════════════════════╝');
      switch (flavor) {
        case 'dev':
          _packageInfo();
          _instance = const BuildConfig._development();
          break;
        case 'stag':
          _packageInfo();
          _instance = const BuildConfig._staging();
          break;
        case 'preprod':
          _instance = const BuildConfig._preprod();
          break;
        default:
          _instance = const BuildConfig._release();
          break;
      }
    }
    _iniLog(flavor);
  }

  static _packageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();
    debugPrint(
        '╔══════════════════════════════════════════════════════════════╗');
    debugPrint(
        '             Package Name: ${packageInfo.packageName}           ');
    debugPrint(
        '             App Name: ${packageInfo.appName}                   ');
    debugPrint(
        '             Version: ${packageInfo.version}                    ');
    debugPrint(
        '             Build Number: ${packageInfo.buildNumber}           ');
    debugPrint(
        '╚══════════════════════════════════════════════════════════════╝');
  }

  static BuildConfig? get() {
    return _instance;
  }

  static _iniLog(flavor) async {
    await Log.init();
    switch (_instance?.flavor) {
      case Flavor.DEVELOPMENT:
      case Flavor.STAGING:
      case Flavor.PREPROD:
        Log.setLevel(Level.ALL);
        break;
      case Flavor.RELEASE:
        Log.setLevel(Level.OFF);
        break;
      default:
        break;
    }
  }

  final String baseUrl;
  final String socketUrl;
  final int connectTimeout;
  final int receiveTimeout;
  final Flavor flavor;
  final Color color;

  static String flavorName() => _instance?.flavor.toString().enumToName ?? "";

  static bool isRelease() => _instance?.flavor == Flavor.RELEASE;

  static bool isProduction() => _instance?.flavor == Flavor.PREPROD;

  static bool isStaging() => _instance?.flavor == Flavor.STAGING;

  static bool isDevelopment() => _instance?.flavor == Flavor.DEVELOPMENT;
}
