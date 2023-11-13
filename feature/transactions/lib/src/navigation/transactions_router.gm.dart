// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'transactions_router.dart';

abstract class _$TransactionsModuleNavigation extends AutoRouterModule {
  @override
  final Map<String, PageFactory> pagesMap = {
    DetailsTransactionRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsTransactionRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailsTransactionScreen(
          transactionModel: args.transactionModel,
          key: args.key,
        ),
      );
    },
    TransactionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TransactionsScreen(),
      );
    },
  };
}

/// generated route for
/// [DetailsTransactionScreen]
class DetailsTransactionRoute
    extends PageRouteInfo<DetailsTransactionRouteArgs> {
  DetailsTransactionRoute({
    required TransactionModel transactionModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          DetailsTransactionRoute.name,
          args: DetailsTransactionRouteArgs(
            transactionModel: transactionModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsTransactionRoute';

  static const PageInfo<DetailsTransactionRouteArgs> page =
      PageInfo<DetailsTransactionRouteArgs>(name);
}

class DetailsTransactionRouteArgs {
  const DetailsTransactionRouteArgs({
    required this.transactionModel,
    this.key,
  });

  final TransactionModel transactionModel;

  final Key? key;

  @override
  String toString() {
    return 'DetailsTransactionRouteArgs{transactionModel: $transactionModel, key: $key}';
  }
}

/// generated route for
/// [TransactionsScreen]
class TransactionsRoute extends PageRouteInfo<void> {
  const TransactionsRoute({List<PageRouteInfo>? children})
      : super(
          TransactionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransactionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
