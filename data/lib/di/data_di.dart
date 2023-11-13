import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/auth_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../mapper/mapper_factory.dart';
import '../providers/local_data_provider.dart';
import '../repositories/auth_repository_impl.dart';
import '../repositories/transactions_repository.dart';

final DataDI dataDI = DataDI();

class DataDI {
  void initDependencies() {
    _initPackages();
    appLocator.registerLazySingleton<MapperFactory>(MapperFactory.new);
    _initProviders();
    _initRepositories();
  }

  void _initPackages() {
    appLocator
        .registerLazySingleton<FlutterSecureStorage>(FlutterSecureStorage.new);
  }

  void _initProviders() {
    appLocator.registerLazySingleton<LocalDataProvider>(
      () => LocalDataProviderImpl(
        appLocator<FlutterSecureStorage>(),
      ),
    );
  }

  void _initRepositories() {
    appLocator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        appLocator<LocalDataProvider>(),
      ),
    );

    appLocator.registerLazySingleton<TransactionsRepository>(
      () => TransactionsRepositoryImpl(
        appLocator<LocalDataProvider>(),
        appLocator<MapperFactory>(),
      ),
    );
  }
}
