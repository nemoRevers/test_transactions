import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LocalDataProvider {
  const LocalDataProvider();
  Future<void> write({required String key, required String value});

  Future<String?> read(String key);

  Future<void> delete(String key);
}

class LocalDataProviderImpl implements LocalDataProvider {
  final FlutterSecureStorage _flutterSecureStorage;

  const LocalDataProviderImpl(FlutterSecureStorage flutterSecureStorage)
      : _flutterSecureStorage = flutterSecureStorage;

  @override
  Future<void> delete(String key) {
    return _flutterSecureStorage.delete(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _flutterSecureStorage.read(key: key);
  }

  @override
  Future<void> write({required String key, required String value}) {
    return _flutterSecureStorage.write(key: key, value: value);
  }
}
