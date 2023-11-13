import 'package:core/di/app_di.dart';

import '../domain.dart';
import '../repositories/auth_repository.dart';
import '../usecases/export_usecases.dart';
import '../usecases/transactions_stream_usecase.dart';

final DomainDI domainDI = DomainDI();

class DomainDI {
  void initDependencies() {
    appLocator.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(
        appLocator<AuthRepository>(),
      ),
    );

    appLocator.registerLazySingleton(
      () => FetchTransactionsUseCase(
        appLocator<TransactionsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<CancelTransactionUseCase>(
      () => CancelTransactionUseCase(
        appLocator<TransactionsRepository>(),
      ),
    );

    appLocator.registerLazySingleton<TransactionsStreamUseCase>(
      () => TransactionsStreamUseCase(
        appLocator<TransactionsRepository>(),
      ),
    );
  }
}
