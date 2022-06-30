import 'dart:math' as math;
import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/native_currency_isar/native_currency_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/wallet_isar/wallet_isar_model.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: IWalletRepository)
class WalletImplementation extends IWalletRepository {
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;

  WalletImplementation(
      this._web3DataSource, this._getStorageDataSource, this._isarDataSource);

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
        networkName: network.name,
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
  Future<Either<Failure, WalletInfoEntity>> importWallet(
      String mnemonic) async {
    try {
      // var testNetwork = (await _isarDataSource.getAllNetwork()).last;
      // _web3DataSource.setCurrentNetwork(testNetwork);
      // _getStorageDataSource.setCurrentChainId(testNetwork.chainId);
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
          networkName: network.name,
          nativeCurrency: nativeCurrency!.toEntity(balance: balance),
        ));
      }
      return const Left(FailureMessage('Invalid Mnemonic'));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, WalletInfoEntity>> currentWallet() async {
    try {
      var testNetwork = (await _isarDataSource.getAllNetwork())[0];
      _web3DataSource.setCurrentNetwork(testNetwork);
      _getStorageDataSource.setCurrentChainId(testNetwork.chainId);
      // var testNetwork = (await _isarDataSource.getAllNetwork()).last;
      // _web3DataSource.setCurrentNetwork(testNetwork);
      // _getStorageDataSource.setCurrentChainId(testNetwork.chainId);
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      int balance = await _web3DataSource.getBalance(wallet.address);

      var nativeCurrency = await _getNativeCurrency();
      return Right(
        wallet.toEntity(
          credentials,
          networkName: network.name,
          nativeCurrency: nativeCurrency!.toEntity(balance: balance),
        ),
      );
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, List<double>>> getBalanceOfTokens(ParamsBalanceOfToken params) async {
    try {
      List<double> values = [];
      for (int i = 0; i < params.addressContract.length; i++) {
        final erc20 = _web3DataSource.tokenFrom(params.addressContract[i]);
        final value = await erc20.balanceOf(
            EthereumAddress.fromHex(params.walletInfoEntity.address));
        final decimals = await erc20.decimals();
        final result = value / BigInt.from(math.pow(10, decimals.toInt()));
        values.add(result);
      }
      return Right(values);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  Future<Either<Failure, bool>> swapAvaxToken(
      double value, String contractAddress) async {
    try {
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);
      _web3DataSource.swapExactAVAXForTokens(
          wallet!.privateKey, wallet.address, contractAddress, value);
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  Future<Either<Failure, bool>> swapTokenAvax(
      double value, String contractAddress) async {
    try {
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);
      _web3DataSource.swapExactTokensForAvax(
          wallet!.privateKey, wallet.address, contractAddress, 18, value);
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, double>> getBalanceToken(
      String contractAddress) async {
    try {
      int balance = 0;
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);
      if (contractAddress == Const.tokens[0]['address']) {
        balance = await _web3DataSource.getBalance(wallet!.address);
        return Right(balance/(pow(10, 18)));
      } else {
        balance = await _web3DataSource.getBalanceOf(
            wallet!.address, contractAddress);
        var decimals = await _web3DataSource.getDecimals(contractAddress);
        return Right(balance/(pow(10, decimals.toInt())));
      }
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> swapToken(double value, String contractAddressFrom, String contractAddressTo) {
    if (contractAddressFrom == Const.tokens[0]['address']) {
      return swapAvaxToken(value, contractAddressTo);
    }
    return swapTokenAvax(value, contractAddressFrom);
  }

  @override
  Future<Either<Failure, bool>> checkFirstOpenWallet() async {
    return const Right(true);
  }

  @override
  Future<Either<FailureMessage, String>> getCurrentMnemonic() async {
    var walletId = _getStorageDataSource.getCurrentWalletId();
    var wallet = await _isarDataSource.getWalletAt(walletId);

    if (wallet == null) {
      return const Left(FailureMessage('Invalid Wallet'));
    }

    return Right(wallet.mnemonic);
  }

  @override
  Future<Either<Failure, double>> getAmountOutMin(double value, String contractAddressFrom, String contractAddressTo) async {
    var walletId = _getStorageDataSource.getCurrentWalletId();
    var wallet = await _isarDataSource.getWalletAt(walletId);
    double amount = await _web3DataSource.getAmountOutMin(wallet!.address, contractAddressFrom, contractAddressTo, value);
    return Right(amount);
  }
}
