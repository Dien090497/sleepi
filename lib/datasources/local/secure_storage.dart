import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';

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

  Future<void> clearStorage() async {
    await Future.wait([
      _secureStorage.deleteAll(),
      _sharedPreferences.clear(),
    ]);
  }
}
