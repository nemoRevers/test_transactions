part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();
}

class InitTransactions extends TransactionsEvent {
  @override
  List<Object?> get props => <Object?>[];
}
