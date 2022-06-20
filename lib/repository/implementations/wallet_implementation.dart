import 'dart:math' as math;

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';

import '../../datasources/local/isar/isar_datasource.dart';
import '../../entities/wallet_info/wallet_info_entity.dart';
import '../../models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import '../../models/isar_models/network_isar/network_isar_model.dart';
import '../../models/isar_models/wallet_isar/wallet_isar_model.dart';

@Injectable(as: IWalletRepository)
class WalletImplementation extends IWalletRepository {
  final _web3DataSource = getIt<Web3DataSource>();
  final _isarDataSource = getIt<IsarDataSource>();
  final _getStorageDataSource = getIt<GetStorageDataSource>();

  @override
  Future<Either<Failure, int>> currentWalletInfo() async {
    try {
      const String address = '0x8b3C0e6753572A123591D50bB0bCE13A00f10e9f';
      var network = await getIt<IsarDataSource>().getNetworkAt(43113);
      await _web3DataSource.init(network!);
      var result = await _web3DataSource.getBalance(address);
      var end = result / math.pow(10, 18);

      return Right(end.toInt());
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> createPasscode(String passcode) {
    // TODO: implement createPasscode
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> createWallet(String address) {
    // TODO: implement createWallet
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, int>> importSeedPhrase(String seedPhrase) {
    // TODO: implement switchNetwork
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> switchNetwork(String address) {
    // TODO: implement switchNetwork
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> verifyPasscode(String passcode) {
    // TODO: implement verifyPasscode
    throw UnimplementedError();
  }

  Future<Either<Failure, WalletInfoEntity>> importWalletFromMnemonic(
      String mnemonic) async {
    try {
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

  Future<NativeCurrencyIsarModel?> _getNativeCurrency() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return _isarDataSource.getNativeCurrency(chainId!);
  }

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }
}
