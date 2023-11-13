import '../models/transaction_model.dart';

abstract class TransactionsRepository {
  Future<List<TransactionModel>> getTransactions();
  Future<void> cancelTransaction(int index);

  Stream<List<TransactionModel>> get broadcastTransactions;

  void addIntoStream(List<TransactionModel> models);
}
