import 'package:auth/src/navigation/auth_router.dart';
import 'package:auto_route/auto_route.dart';
import 'package:transactions/src/navigation/transactions_router.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(
  modules: <Type>[
    AuthModuleNavigation,
    TransactionsModuleNavigation,
  ],
)
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          initial: true,
          page: AuthRoute.page,
        ),
        AutoRoute(
          page: TransactionsRoute.page,
        ),
        AutoRoute(
          page: DetailsTransactionRoute.page,
        ),
      ];
}
