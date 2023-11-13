part of 'transactions_bloc.dart';

class TransactionsState extends Equatable {
  final List<TransactionModel> transactions;

  const TransactionsState([this.transactions = const <TransactionModel>[]]);

  TransactionsState copyWith({
    List<TransactionModel>? transactions,
  }) {
    return TransactionsState(
      transactions ?? this.transactions,
    );
  }

  @override
  List<Object?> get props => <Object?>[transactions];
}
