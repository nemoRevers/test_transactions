import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/models/transaction_model.dart';
import 'package:flutter/material.dart';

import '../bloc/transactions/transactions_bloc.dart';
import '../components/transaction_card.dart';

class TransactionsForm extends StatelessWidget {
  const TransactionsForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: AppDimens.ELEVATION_0,
        backgroundColor: appColors.secondaryBg,
        title: Text(
          LocaleKeys.transactions.watchTr(context),
          style: AppFonts.normal15.copyWith(
            color: appColors.text,
          ),
        ),
      ),
      body: BlocBuilder<TransactionsBloc, TransactionsState>(
        builder: (BuildContext context, TransactionsState state) {
          return ListView.builder(
            itemCount: state.transactions.length,
            itemBuilder: (BuildContext context, int index) {
              final TransactionModel transaction = state.transactions[index];
              return TransactionCard(
                model: transaction,
              );
            },
          );
        },
      ),
    );
  }
}
