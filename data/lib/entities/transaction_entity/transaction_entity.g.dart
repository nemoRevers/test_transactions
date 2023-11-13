// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransactionEntity _$TransactionEntityFromJson(Map<String, dynamic> json) =>
    TransactionEntity(
      dateTime: DateTime.parse(json['dateTime'] as String),
      amount: (json['amount'] as num).toDouble(),
      fee: (json['fee'] as num).toDouble(),
      id: json['id'] as int,
      type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$TransactionEntityToJson(TransactionEntity instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime.toIso8601String(),
      'amount': instance.amount,
      'fee': instance.fee,
      'id': instance.id,
      'type': _$TransactionTypeEnumMap[instance.type]!,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.replenishment: 'replenishment',
  TransactionType.transfer: 'transfer',
  TransactionType.withdrawal: 'withdrawal',
};
