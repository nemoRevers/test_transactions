import 'dart:convert';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/repositories/auth_repository.dart';

import '../data.dart';
import '../entities/entities.dart';

class AuthRepositoryImpl implements AuthRepository {
  final LocalDataProvider _localDataProvider;

  const AuthRepositoryImpl(LocalDataProvider localDataProvider)
      : _localDataProvider = localDataProvider;
  @override
  Future<bool> auth(
    String login,
    String password,
  ) async {
    final String? json = await _localDataProvider.read(StorageConstants.user);
    if (json == null) {
      throw AppException(LocaleKeys.requestFailed);
    }
    final UserEntity userEntity = UserEntity.fromJson(
      jsonDecode(json),
    );
    return userEntity.password == password && userEntity.email == login;
  }
}
