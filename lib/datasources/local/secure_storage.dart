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

  Future<String?> getAccessToken() =>
      _secureStorage.read(key: StorageKeys.accessTokenKey);

  Future<void> saveAccessToken(String accessToken) =>
      _secureStorage.write(key: StorageKeys.accessTokenKey, value: accessToken);

  Future<void> saveAddressContract({required String addressContract}) =>
      _secureStorage.write(key: StorageKeys.addressContractSpending, value: addressContract);

  Future<void> saveMessage({required String saveMessage}) =>
      _secureStorage.write(key: StorageKeys.saveMessage, value: saveMessage);

  Future<String?> readAddressContract() =>
      _secureStorage.read(key: StorageKeys.addressContractSpending);

  Future<String?> readMessage() =>
      _secureStorage.read(key: StorageKeys.saveMessage);

  Future<void> setAccessToken(String token) =>
      _secureStorage.write(key: StorageKeys.accessTokenKey, value: token);

  Future<String?> getRefreshToken() =>
      _secureStorage.read(key: StorageKeys.refreshToken);

  Future<void> setRefreshToken(String token) =>
      _secureStorage.write(key: StorageKeys.refreshToken, value: token);

  Future<void> saveSignatureMessage({required String signatureMessage}) =>
      _secureStorage.write(key: StorageKeys.signatureMessage, value: signatureMessage);

  Future<String?> readSignatureMessage() =>
      _secureStorage.read(key: StorageKeys.signatureMessage);

  Future<void> saveSigner({required String signer}) =>
      _secureStorage.write(key: StorageKeys.signer, value: signer);

  Future<String?> readSigner() =>
      _secureStorage.read(key: StorageKeys.signer);
}
