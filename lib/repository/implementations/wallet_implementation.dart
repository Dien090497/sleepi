import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'dart:math' as math;
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/wallet_isar/wallet_isar_model.dart';
import 'package:slee_fi/repository/implementations/wallet_repository.dart';

@Injectable(as: IWalletRepository)
class WalletImplementation extends IWalletRepository {
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;

  WalletImplementation(
      this._web3DataSource, this._getStorageDataSource, this._isarDataSource);

  @override
  Future<Either<Failure, int>> currentWalletInfo() async {
    try {
      const String address = '0x8b3C0e6753572A123591D50bB0bCE13A00f10e9f';
      var network = await _isarDataSource.getNetworkAt(43113);
      await _web3DataSource.init(network!);
      var result = await _web3DataSource.getBalance(address);
      var end = result / math.pow(10, 18);

      return Right(end.toInt());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, WalletInfoEntity>> createWallet() async {
    try {
      final String mnemonic = _web3DataSource.createMnemonic();
      final derivedIndex = _getStorageDataSource.getDerivedIndexAndIncrease();
      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          mnemonic, derivedIndex, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final ethereumAddress = await credentials.extractAddress();

      /// Store Wallet

      final model = WalletIsarModel(
        mnemonic: mnemonic,
        privateKey: privateKey,
        name: 'Account $derivedIndex',
        address: ethereumAddress.hex,
        derivedIndex: derivedIndex,
      );
      final int walletId = await _isarDataSource.putWallet(model);
      model.id = walletId;
      await _getStorageDataSource.setCurrentWalletId(walletId);
      final nativeCurrency = await _getNativeCurrency();
      final balance = await _web3DataSource.getBalance(ethereumAddress.hex);
      return Right(model.toEntity(
        credentials,
        derivedIndex: derivedIndex,
        nativeCurrency: nativeCurrency!.toEntity(balance: balance),
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  Future<NativeCurrencyIsarModel?> _getNativeCurrency() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return _isarDataSource.getNativeCurrency(chainId!);
  }

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  @override
  Future<Either<Failure, bool>> swapToken() async {
    try {
      _web3DataSource.swapToken();
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, WalletInfoEntity>> importWallet(
      String mnemonic) async {
    try {
      _web3DataSource
          .setCurrentNetwork((await _isarDataSource.getAllNetwork()).first);
      if (_web3DataSource.validateMnemonic(mnemonic)) {
        final derivedIndex = _getStorageDataSource.getDerivedIndexAndIncrease();
        final network = await _getCurrentNetwork();
        final privateKey = _web3DataSource.mnemonicToPrivateKey(
            mnemonic, derivedIndex, network.slip44);
        final credentials =
            _web3DataSource.credentialsFromPrivateKey(privateKey);
        final ethereumAddress = await credentials.extractAddress();

        /// Store Wallet

        final model = WalletIsarModel(
          privateKey: privateKey,
          name: 'Account $derivedIndex',
          address: ethereumAddress.hex,
          derivedIndex: derivedIndex,
          mnemonic: mnemonic,
        );
        final int walletId = await _isarDataSource.putWallet(model);
        model.id = walletId;
        await _getStorageDataSource.setCurrentWalletId(walletId);
        final nativeCurrency = await _getNativeCurrency();
        final balance = await _web3DataSource.getBalance(ethereumAddress.hex);
        return Right(model.toEntity(
          credentials,
          derivedIndex: derivedIndex,
          nativeCurrency: nativeCurrency!.toEntity(balance: balance),
        ));
      }
      return const Left(FailureMessage('Invalid Mnemonic'));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
