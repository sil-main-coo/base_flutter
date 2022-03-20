import 'package:base_flutter/@core/di/di_module.dart';
import 'package:base_flutter/data/repositories/auth_repository_impl.dart';
import 'package:base_flutter/domain/repositories/auth_repository.dart';

class RepoModule extends DIModule {
  @override
  provides() {
    getIt.registerFactory<AuthRepository>(
        () => AuthRepositoryImpl(authRemoteSource: getIt()));
  }
}
