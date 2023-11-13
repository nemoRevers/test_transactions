import 'dart:async';
import 'dart:convert';

import 'package:core/constants/storage_constants.dart';
import 'package:core/src/localization/generated/locale_keys.g.dart';
import 'package:domain/domain.dart';

import '../data.dart';
import '../entities/transaction_entity/transaction_entity.dart';
import '../mapper/base_mapper.dart';
import '../mapper/mapper_factory.dart';

class TransactionsRepositoryImpl implements TransactionsRepository {
  final MapperFactory _mapperFactory;
  final LocalDataProvider _localDataProvider;
  List<TransactionModel> _transactions = <TransactionModel>[];

  late final StreamController<List<TransactionModel>> _streamContoller;

  TransactionsRepositoryImpl(
    LocalDataProvider localDataProvider,
    MapperFactory mapperFactory,
  )   : _localDataProvider = localDataProvider,
        _mapperFactory = mapperFactory {
    _streamContoller = StreamController<List<TransactionModel>>();
  }

  @override
  Future<List<TransactionModel>> getTransactions() async {
    if (_transactions.isEmpty) {
      final String? result =
          await _localDataProvider.read(StorageConstants.transactions);
      if (result == null) {
        throw AppException(LocaleKeys.requestFailed);
      }
      final List<TransactionEntity> entities = (jsonDecode(result)
              as List<dynamic>)
          .map<Map<String, dynamic>>((dynamic e) => e as Map<String, dynamic>)
          .map<TransactionEntity>(TransactionEntity.fromJson)
          .toList();
      _transactions = _mapperFactory.transactionMapper.fromList(entities);
    }
    return _transactions;
  }

  @override
  Future<void> cancelTransaction(int id) {
    _transactions.removeWhere((TransactionModel model) => model.id == id);
    addIntoStream(_transactions);
    final List<TransactionEntity> transactions =
        _mapperFactory.transactionMapper.toList(_transactions);
    final List<Map<String, dynamic>> jsons =
        transactions.map((TransactionEntity e) => e.toJson()).toList();
    return _localDataProvider.write(
        key: StorageConstants.transactions, value: jsonEncode(jsons));
  }

  @override
  Stream<List<TransactionModel>> get broadcastTransactions =>
      _streamContoller.stream.asBroadcastStream();

  @override
  void addIntoStream(List<TransactionModel> models) {
    _transactions = models;
    _streamContoller.add(models);
  }
}
