import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/history_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/history_isar/history_isar_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';
import 'package:web3dart/web3dart.dart';

@Injectable(as: ITransactionRepository)
class TransactionImplementation extends ITransactionRepository{
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;
  final HistoryDataSource _historyDataSource;

  TransactionImplementation(this._web3DataSource, this._getStorageDataSource, this._isarDataSource, this._historyDataSource);

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  @override
  Future<Either<Failure, bool>> sendToExternal(SendToExternalParams params) async{
    try{
      final chainId = _getStorageDataSource.getCurrentChainId();
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);

      final result = await _web3DataSource.sendCoinTxn(
          credentials: credentials,
          to: params.contractAddressTo,
          valueInEther: params.valueInEther ?? 0.0,
          chainId: chainId);


      if(result.isNotEmpty){
        final model = HistoryIsarModel(
          transactionHash: result,
          chainId: chainId!,
          addressTo: params.contractAddressTo,
        );
        await _historyDataSource.putHistory(model);
      }
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, int>> calculatorFee(SendToExternalParams params) async{
    try {
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);

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
      return Right(fee);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, double>> getTokenBalance() async{
    try {
      double balance = 0;
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);
      final result = await _web3DataSource.getBalance(wallet!.address);
      balance = result / BigInt.from(pow(10, 18));
      return Right(balance);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> transferTokenErc20(SendTokenExternalParams params) async {
    try {
      _getStorageDataSource.getCurrentChainId();
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }
      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final erc20 = _web3DataSource.tokenFrom(params.tokenEntity?.address ?? '');
      final recipient = EthereumAddress.fromHex(params.toAddress);
      final amount = EtherAmount.fromUnitAndValue(EtherUnit.wei, BigInt.from(params.valueInEther * pow(10, 18))).getValueInUnitBI(EtherUnit.wei);
      erc20.transfer(
        recipient,
        amount,
        credentials: credentials,
      );
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

}