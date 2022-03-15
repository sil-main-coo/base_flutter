import 'package:base_flutter/di/module/api_module.dart';
import 'package:base_flutter/di/module/components_module.dart';
import 'package:base_flutter/di/module/local_module.dart';
import 'package:base_flutter/di/module/repo_module.dart';

class Injection {
  static Future inject() async {
    ComponentsModule().provides();
    LocalModule().provides();
    await ApiModule().provides();
    RepoModule().provides();
    // await UseCaseModule().provides();
  }
}
