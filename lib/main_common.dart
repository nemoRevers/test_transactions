import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:core/core.dart';
import 'package:core/enums/transaction_type.dart';
import 'package:data/entities/transaction_entity/transaction_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'app.dart';

Future<void> mainCommon(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  _setupDI(flavor);
  runApp(const App());
}

void _setupDI(Flavor flavor) {
  _initEntities();
  appLocator.pushNewScope(
    scopeName: unauthScope,
    init: (_) {
      AppDI.initDependencies(flavor);
    },
  );
}

Future<void> _initEntities() async {
  final Random random = Random();
  const FlutterSecureStorage storage = FlutterSecureStorage();
  await storage.write(
    key: StorageConstants.user,
    value: jsonEncode(
      const UserEntity(
        'user@mail.com',
        '1111',
      ).toJson(),
    ),
  );
  await storage.write(
    key: StorageConstants.transactions,
    value: jsonEncode(
      List<Map<String, dynamic>>.generate(
        20,
        (int index) => TransactionEntity(
          dateTime: DateTime.now(),
          amount: random.nextInt(100).toDouble(),
          fee: random.nextInt(7).toDouble(),
          id: index++,
          type: TransactionType.values.elementAt(
            random.nextInt(
              TransactionType.values.length,
            ),
          ),
        ).toJson(),
      ),
    ),
  );
}
