import 'package:core/enums/transaction_type.dart';

class TransactionModel {
  final DateTime dateTime;
  final double amount;
  final double fee;
  final int id;
  final TransactionType type;

  const TransactionModel({
    required this.dateTime,
    required this.amount,
    required this.fee,
    required this.id,
    required this.type,
  });
}
