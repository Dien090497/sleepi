import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/history/history_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/secret.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';

@Injectable()
class TransactionRemoteDataSource{
  final Web3DataSource _web3dataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;
  final Dio dio;

  TransactionRemoteDataSource(this._web3dataSource, this._getStorageDataSource, this._isarDataSource, this.dio);

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  Future<Either<Failure, HistoryModel>> getHistoryTransaction(HistoryTransactionParams params) async {
    try {
     var walletId = _getStorageDataSource.getCurrentWalletId();
      var wallet = await _isarDataSource.getWalletAt(walletId);

      if (wallet == null) {
        return const Left(FailureMessage('Invalid Wallet'));
      }

      final network = await _getCurrentNetwork();
      final privateKey = _web3dataSource.mnemonicToPrivateKey(
          wallet.mnemonic, wallet.derivedIndex!, network.slip44);
      final credentials = _web3dataSource.credentialsFromPrivateKey(privateKey);
      final ethereumAddress = await credentials.extractAddress();
      String url = 'https://testnet.snowtrace.io/api?module=account&action=${params.typeHistory}&address=$ethereumAddress&startblock=0&endblock=99999999&sort=desc&apikey=$apiKey"';
      var dataResponse = await dio.get(url);
      var history = HistoryModel.fromJson(dataResponse.data as Map<String, dynamic>);
      return Right(history);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
    }

}