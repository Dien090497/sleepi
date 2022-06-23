import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
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
  Future<Either<Failure, SendToExternalEntity>> sendToExternal(SendToExternalParams params) async{
    try {
      final chainId = _getStorageDataSource.getCurrentChainId();
      var walletId = _getStorageDataSource.getCurrentWalletId();
      if (walletId == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

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
          to: params.toAddress,
          valueInEther: params.valueInEther,
          chainId: chainId);

      final model = TransactionIsarModel(
        toAddress: params.toAddress,
        valueInEther: params.valueInEther,
      );
      return Right(model.toEntity(
        credentials,
        chainId: chainId,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, double>> calculatorFee() async{
    try{
      var gasPrice = await _web3DataSource.getGasPrice();
      return const Right(0);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, int>> getBalance() async{
    try {
      final chainId = _getStorageDataSource.getCurrentChainId();
      var walletId = _getStorageDataSource.getCurrentWalletId();
      if (walletId == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      var wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3DataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3DataSource.credentialsFromPrivateKey(privateKey);
      final ethereumAddress = await credentials.extractAddress();

      final balance = await _web3DataSource.getBalance(ethereumAddress.hex);
      return Right(balance);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

}