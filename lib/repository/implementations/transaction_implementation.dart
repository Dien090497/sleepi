import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:decimal/decimal.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/history_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/history_isar/history_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/token_isar/token_isar_model.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ITransactionRepository)
class TransactionImplementation extends ITransactionRepository {
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;
  final SecureStorage _secureStorage;
  final IsarDataSource _isarDataSource;
  final HistoryDataSource _historyDataSource;

  TransactionImplementation(this._web3DataSource, this._getStorageDataSource,
      this._isarDataSource, this._historyDataSource, this._secureStorage);

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  @override
  Future<Either<Failure, bool>> sendToExternal(
      SendToExternalParams params) async {
    try {
      final chainId = _getStorageDataSource.getCurrentChainId();
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);

      final addressTo = params.contractAddressTo.isEmpty
          ? await _secureStorage.readAddressContract() ?? ''
          : params.contractAddressTo;
      final result = await _web3DataSource.sendCoinTxn(
          credentials: credentials,
          to: addressTo,
          valueInEther: params.valueInEther ?? 0.0,
          chainId: chainId);

      if (result.isNotEmpty) {
        final model = HistoryIsarModel(
            transactionHash: result,
            chainId: chainId!,
            addressTo: addressTo,
            tokenSymbol: params.tokenSymbol!);
        await _historyDataSource.putHistory(model);
      }
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, int>> calculatorFee(
      SendToExternalParams params) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final ethereumAddress = await credentials.extractAddress();
      final fee = await _web3DataSource.estimateGas(
        sender: ethereumAddress,
        to: '0x7AEC68f23e813a9E7c3d1B9B3fe16c48AF1124ef',
        value: params.valueInEther,
        // gasPrice: 50
      );
      return Right(fee.toInt());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, double>> getTokenBalance(SendToExternalParams params) async {
    try {
      double balance = 0;
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      if (params.tokenSymbol != null && params.tokenSymbol == 'AVAX') {
        final result = await _web3DataSource.getBalance(wallet!.address);
        balance = result / BigInt.from(pow(10, 18));
        return Right(balance);
      } else {
        final balanceOfToken = (await _web3DataSource.getBalanceOf(
          wallet!.address, params.contractAddressTo));
        final decimals = await _web3DataSource.getDecimals(params.contractAddressTo);
        balance =  balanceOfToken / BigInt.from(pow(10, decimals.toInt()));
        return Right(balance);
      }

    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> transferTokenErc20(
      SendTokenExternalParams params) async {
    try {
      final chainId = _getStorageDataSource.getCurrentChainId();
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }
      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final erc20 = _web3DataSource.token(params.tokenEntity?.address ?? '');
      final recipient = EthereumAddress.fromHex(params.toAddress);
      final decimal = await erc20.decimals();
      final amount = Decimal.parse('${params.valueInEther}') * Decimal.fromBigInt(BigInt.from(pow(10, decimal.toInt())));
      final result = await erc20.transfer(
        recipient,
        Decimal.parse(amount.toString()).toBigInt(),
        credentials: credentials,
      );
      if (result.isNotEmpty) {
        final model = HistoryIsarModel(
            transactionHash: result,
            chainId: chainId!,
            addressTo: params.toAddress,
            tokenSymbol: params.tokenEntity!.symbol);
        await _historyDataSource.putHistory(model);
      }
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, double>> estimateGasFee(
      {String? sender, String? to, double? value}) async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      final gasPrice = await _web3DataSource.getGasPrice();
      final price = await _web3DataSource.estimateGas(
        value: value,
        gasPrice: gasPrice,
        sender: sender != null
            ? EthereumAddress.fromHex(sender)
            : EthereumAddress.fromHex(wallet!.address),
        to: to,
      );
      return Right(price * gasPrice.getInWei / BigInt.from(pow(10, 18)));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, double>> estimateGasFeeTrade() async {
    try {
      final walletId = _getStorageDataSource.getCurrentWalletId();
      final wallet = await _isarDataSource.getWalletAt(walletId);
      final gasPrice = await _web3DataSource.getGasPrice();
      final price = await _web3DataSource.estimateGasAvaxTrade(
        gasPrice: gasPrice,
        sender: EthereumAddress.fromHex(wallet!.address),
      );
      return Right(price * gasPrice.getInWei / BigInt.from(pow(10, 18)));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, String>> getCurrentNetworkExplorer() async {
    try {
      final network = await _getCurrentNetwork();
      // String urlDetail = '${network.explorers.first.url}/tx/$hash';
      return Right(network.explorers.first.url);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
