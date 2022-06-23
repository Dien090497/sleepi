import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
import 'package:slee_fi/repository/transaction_repository.dart';

@Injectable(as: ITransactionRepository)
class TransactionImplementation extends ITransactionRepository{
  final Web3DataSource _web3DataSource;
  final GetStorageDataSource _getStorageDataSource;

  TransactionImplementation(this._web3DataSource, this._getStorageDataSource);

  @override
  Future<Either<Failure, SendToExternalEntity>> sendToExternal() async{
    try {
      final chainId = _getStorageDataSource.getCurrentChainId();
      final credentials =
      _web3DataSource.credentialsFromPrivateKey("8bc930e084ce3b80402e990aeff7a27ba6829ecf0c398a3bed12ffadaecd39ae");
      _web3DataSource.sendCoinTxn(
          credentials: credentials,
          to: "0x52839A88E9FdD2b137E32c65fEc8E7b3f1F1CCC6",
          valueInEther: 0.001,
          chainId: chainId);

      final model = TransactionIsarModel(
        toAddress: "0x52839A88E9FdD2b137E32c65fEc8E7b3f1F1CCC6",
        valueInEther: 0.01,
      );
      return Right(model.toEntity(
        credentials,
        chainId: chainId,
      ));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

}