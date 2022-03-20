import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/presentation/components/dialogs/loader_dialog.dart';

class SharedModule extends DIModule {
  @override
  provides() {
    getIt.registerSingleton(LoaderDialog());
  }
}
