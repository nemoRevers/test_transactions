import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:domain/models/transaction_model.dart';
import 'package:domain/usecases/export_usecases.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:equatable/equatable.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final FetchTransactionsUseCase _fetchTransactionsUseCase;
  final TransactionsStreamUseCase _transactionsStreamUseCase;
  late final StreamSubscription<List<TransactionModel>> _streamSubscription;

  TransactionsBloc(
    FetchTransactionsUseCase fetchTransactionsUseCase,
    TransactionsStreamUseCase transactionsStreamUseCase,
  )   : _fetchTransactionsUseCase = fetchTransactionsUseCase,
        _transactionsStreamUseCase = transactionsStreamUseCase,
        super(const TransactionsState()) {
    on<InitTransactions>(
      (InitTransactions event, Emitter<TransactionsState> emit) async {
        final List<TransactionModel> transactions =
            await _fetchTransactionsUseCase.execute(const NoParams());
        emit(state.copyWith(transactions: <TransactionModel>[...transactions]));
      },
    );
    _streamSubscription = _transactionsStreamUseCase
        .execute(const NoParams())
        .listen((List<TransactionModel> event) {
      add(InitTransactions());
    });
    add(InitTransactions());
  }

  void dispose() {
    _streamSubscription.cancel();
  }
}
