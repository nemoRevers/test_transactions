import 'package:domain/models/transaction_model.dart';

import '../entities/transaction_entity/transaction_entity.dart';
import 'base_mapper.dart';

class TransactionMapper implements Mapper<TransactionEntity, TransactionModel> {
  const TransactionMapper();

  @override
  TransactionModel fromEntity(TransactionEntity entity) {
    return TransactionModel(
      dateTime: entity.dateTime,
      amount: entity.amount,
      fee: entity.fee,
      id: entity.id,
      type: entity.type,
    );
  }

  @override
  TransactionEntity toEntity(TransactionModel item) {
    return TransactionEntity(
      dateTime: item.dateTime,
      amount: item.amount,
      fee: item.fee,
      id: item.id,
      type: item.type,
    );
  }
}
