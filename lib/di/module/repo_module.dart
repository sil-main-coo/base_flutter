import 'package:base_flutter/@core/di/di_module.dart';

class RepoModule extends DIModule {
  @override
  provides()  {
    // Get.lazyPut<AccountRepository>(() =>
    //     AccountRepoImplement(remoteSource: getIt.get<AccountRemoteSource>()));
  }
}
