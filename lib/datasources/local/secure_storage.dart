import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/models/user/user_info_model.dart';

@Injectable()
class SecureStorage {
  final FlutterSecureStorage _secureStorage;
  final SharedPreferences _sharedPreferences;

  SecureStorage(this._secureStorage, this._sharedPreferences) {
    final firstInstall = _sharedPreferences.getBool(StorageKeys.firstInstall);
    if (firstInstall ?? true) {
      _secureStorage.deleteAll();
      _sharedPreferences.setBool(StorageKeys.firstInstall, false);
    }
  }

  Future<void> writePassCode(String pc) =>
      _secureStorage.write(key: StorageKeys.passCodeKey, value: pc);

  Future<String?> readPassCode() =>
      _secureStorage.read(key: StorageKeys.passCodeKey);

  Future<bool> hasPassCode() async =>
      await _secureStorage.read(key: StorageKeys.passCodeKey) != null;

  Future<void> clearStorage() async {
    await Future.wait([
      _secureStorage.deleteAll(),
      _sharedPreferences.clear(),
    ]);
  }

  Future<void> writeUser(UserInfoModel userInfoModel) async {
    _secureStorage.write(
        key: StorageKeys.userKey, value: json.encode(userInfoModel.toJson()));
  }

  Future<UserInfoModel?> readCurrentUser() async {
    final contains = await _secureStorage.containsKey(key: StorageKeys.userKey);
    if (!contains) {
      return null;
    }
    final value = await _secureStorage.read(key: StorageKeys.userKey) as String;
    return UserInfoModel.fromJson(json.decode(value));
  }

  Future<bool> isFirstOpenApp() async =>
      await _secureStorage.read(key: StorageKeys.firstOpenKey) == null;

  Future<void> makeFirstOpen() async {
    await _secureStorage.write(key: StorageKeys.firstOpenKey, value: 'first');
  }
}
