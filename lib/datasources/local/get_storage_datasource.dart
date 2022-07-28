import 'package:get_storage/get_storage.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class GetStorageDataSource {
  final GetStorage _getStorage;

  GetStorageDataSource(this._getStorage) {
    if (_getStorage.read(StorageKeys.derivedIndexKey) == null) {
      _getStorage.write(StorageKeys.derivedIndexKey, 0);
    }
  }

  int getDerivedIndexAndIncrease() {
    final index = _getStorage.read<int?>(StorageKeys.derivedIndexKey)!;
    _getStorage.write(StorageKeys.derivedIndexKey, index + 1);
    return 0;
  }

  Future<void> setCurrentWalletId(int id) =>
      _getStorage.write(StorageKeys.currentWalletIdKey, id);

  Future<void> setCurrentChainId(int id) =>
      _getStorage.write(StorageKeys.currentChainIdKey, id);

  int getCurrentWalletId() =>
      _getStorage.read<int?>(StorageKeys.currentWalletIdKey) ?? 1;

  int? getCurrentChainId() =>
      _getStorage.read<int?>(StorageKeys.currentChainIdKey) ?? 43113;

  Future<void> clearAll() => _getStorage.erase();
}

class StorageKeys {
  static const String currentChainIdKey = 'current_chain_id';
  static const String listNetworksKey = 'list_networks';
  static const String derivedIndexKey = 'derive_index';
  static const String passCodeKey = 'pass_code';
  static const String firstInstall = 'first_install';
  static const String currentWalletIdKey = 'current_wallet_id';
  static const String userKey = 'current_user';
  static const String firstOpenKey = 'first_open_key';
  static const String accessTokenKey = 'access_token_key';
  static const String addressContractSpending = 'address_contract_spending';
  static const String saveMessage = 'save_message';
  static const String refreshToken = 'refresh_token';
  static const String signatureMessage = 'signature_message';
  static const String signer = 'signer';
  static const String tokenAddresses = 'tokenAddresses';
  static const String nftAddresses = 'nftAddresses';
  static const String lastUserSignIn = 'last_user_sign_in';
}
