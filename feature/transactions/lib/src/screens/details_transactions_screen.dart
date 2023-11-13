import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/cancel_transaction_usecase.dart';
import 'package:flutter/material.dart';
import 'package:navigation/navigation.dart';

import '../bloc/details/details_bloc.dart';
import 'details_transaction_form.dart';

@RoutePage()
class DetailsTransactionScreen extends StatelessWidget {
  final TransactionModel transactionModel;
  const DetailsTransactionScreen({
    required this.transactionModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (BuildContext _) => DetailsBloc(
        appLocator<CancelTransactionUseCase>(),
      ),
      child: DetailsTransactionForm(transactionModel: transactionModel),
    );
  }
}
