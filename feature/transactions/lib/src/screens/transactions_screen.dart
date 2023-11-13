import 'package:core/core.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/transactions/transactions_bloc.dart';
import 'transactions_form.dart';

@RoutePage()
class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TransactionsBloc>(
      create: (BuildContext _) => TransactionsBloc(
        appLocator<FetchTransactionsUseCase>(),
        appLocator<TransactionsStreamUseCase>(),
      ),
      child: const TransactionsForm(),
    );
  }
}
