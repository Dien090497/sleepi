import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';

@Injectable(as: ITransactionRepository)
class TransactionImplementation extends ITransactionRepository{
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;

  TransactionImplementation(this._web3DataSource, this._getStorageDataSource, this._isarDataSource);

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  @override
  Future<Either<Failure, bool>> sendToExternal(SendToExternalParams params) async{
    try {
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

      _web3DataSource.sendCoinTxn(
          credentials: credentials,
          to: params.contractAddressTo,
          valueInEther: params.valueInEther,
          chainId: chainId);

      // final model = TransactionIsarModel(
      //   toAddress: params.toAddress,
      //   valueInEther: params.valueInEther,
      // );
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
            to: params.contractAddressTo,
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
      int balance = 0;
      var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);
       balance = await _web3DataSource.getBalance(wallet!.address);
      return Right(balance/(pow(10, 18)));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

}