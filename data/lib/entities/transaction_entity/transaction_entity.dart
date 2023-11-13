import 'package:core/enums/transaction_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_entity.g.dart';

@JsonSerializable()
class TransactionEntity {
  final DateTime dateTime;
  final double amount;
  final double fee;
  final int id;
  final TransactionType type;

  const TransactionEntity({
    required this.dateTime,
    required this.amount,
    required this.fee,
    required this.id,
    required this.type,
  });

  factory TransactionEntity.fromJson(Map<String, dynamic> json) =>
      _$TransactionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$TransactionEntityToJson(this);
}
