import 'package:auto_route/auto_route.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

import '../navigation/transactions_router.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel model;

  const TransactionCard({
    required this.model,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final AppColors appColors = AppColors.of(context);

    return GestureDetector(
      onTap: () {
        context.router.push(DetailsTransactionRoute(transactionModel: model));
      },
      child: Container(
        margin: const EdgeInsets.all(AppDimens.PADDING_6),
        padding: const EdgeInsets.all(AppDimens.PADDING_10),
        decoration: BoxDecoration(
          color: AppColors.of(context).secondaryBg,
          border: Border.all(
            color: AppColors.of(context).divider,
          ),
          borderRadius: BorderRadius.circular(
            AppDimens.RADIUS_15,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              model.id.toString(),
              textAlign: TextAlign.right,
              style: AppFonts.bold24.copyWith(
                color: appColors.text,
              ),
            ),
            Divider(
              color: appColors.divider,
            ),
            Text(
              'Amount: ${model.amount}',
              textAlign: TextAlign.left,
              style: AppFonts.bold24.copyWith(
                color: appColors.text,
              ),
            ),
            const SizedBox(height: AppDimens.HEIGHT_14),
            Text(
              'Type: ${model.type.title}',
              textAlign: TextAlign.left,
              style: AppFonts.bold24.copyWith(
                color: appColors.text,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
