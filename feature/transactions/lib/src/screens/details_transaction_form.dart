import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:navigation/navigation.dart';

import '../bloc/details/details_bloc.dart';

class DetailsTransactionForm extends StatelessWidget {
  final TransactionModel transactionModel;
  const DetailsTransactionForm({required this.transactionModel, super.key});

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('yy MM dd hh:mm');
    final AppColors appColors = AppColors.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: AppDimens.ELEVATION_0,
        backgroundColor: appColors.secondaryBg,
        title: Text(
          LocaleKeys.details.watchTr(context),
          style: AppFonts.normal15.copyWith(
            color: appColors.text,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppDimens.PADDING_8),
          child: Column(
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Text(
                    'Datetime: ${dateFormat.format(transactionModel.dateTime)}',
                    style: AppFonts.bold24.copyWith(
                      color: AppColors.of(context).text,
                    ),
                  ),
                  Divider(color: appColors.text),
                  Text(
                    'Amount: ${transactionModel.amount}',
                    style: AppFonts.bold24.copyWith(
                      color: AppColors.of(context).text,
                    ),
                  ),
                  Divider(color: appColors.text),
                  Text(
                    'Fee: ${transactionModel.fee}',
                    style: AppFonts.bold24.copyWith(
                      color: AppColors.of(context).text,
                    ),
                  ),
                  Divider(color: appColors.text),
                  Text(
                    'Bottom line: ${transactionModel.fee + transactionModel.amount}',
                    style: AppFonts.bold24.copyWith(
                      color: AppColors.of(context).text,
                    ),
                  ),
                  Divider(color: appColors.text),
                  Text(
                    'ID: ${transactionModel.id}',
                    style: AppFonts.bold24.copyWith(
                      color: AppColors.of(context).text,
                    ),
                  ),
                  Divider(color: appColors.text),
                  Text(
                    'Type: ${transactionModel.type.title}',
                    style: AppFonts.bold24.copyWith(
                      color: AppColors.of(context).text,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: AppDimens.HEIGHT_64,
                child: AppButton(
                  child: Text(
                    LocaleKeys.cancel.watchTr(context),
                  ),
                  onPressed: () {
                    context
                        .read<DetailsBloc>()
                        .add(CancelEvent(transactionModel.id));
                    context.router.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
