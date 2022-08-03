import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/history_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/remote/network/web3_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/history/history_model.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/transaction_history/transaction_history_model.dart';
import 'package:slee_fi/secret.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';

@Injectable()
class TransactionRemoteDataSource{
  final HistoryDataSource _historyDataSource;
  final Web3DataSource _web3dataSource;
  final GetStorageDataSource _getStorageDataSource;
  final IsarDataSource _isarDataSource;
  final Dio dio;

  TransactionRemoteDataSource(this._historyDataSource, this._web3dataSource, this._getStorageDataSource, this._isarDataSource, this.dio);

  Future<NetworkIsarModel> _getCurrentNetwork() async {
    final chainId = _getStorageDataSource.getCurrentChainId();
    return (await _isarDataSource.getNetworkAt(chainId!))!;
  }

  Future<Either<Failure, List<TransactionHistoryModel>>> getHistoryTransaction(HistoryTransactionParams params) async {
    try {
      List<TransactionHistoryModel> transactionsHistory = [];
      final historyTransaction = await _historyDataSource.getAllHistory();
    if(historyTransaction.isNotEmpty){
        final walletId = _getStorageDataSource.getCurrentWalletId();
        final wallet = await _isarDataSource.getWalletAt(walletId);

        if (wallet == null) {
          return const Left(FailureMessage('Invalid Wallet'));
        }

        final network = await _getCurrentNetwork();
        final privateKey = _web3dataSource.mnemonicToPrivateKey(
            wallet.mnemonic, wallet.derivedIndex!, network.slip44);
        final credentials = _web3dataSource.credentialsFromPrivateKey(privateKey);
        final ethereumAddress = await credentials.extractAddress();
        List transactionByToken = historyTransaction.where((i) {
          return i.tokenSymbol.contains(params.tokenSymbol!);
        }).toList();
        int start = 5*(params.page! - 1);
        int end = 5*params.page! > transactionByToken.length ? transactionByToken.length : 5*params.page!;
        for(int i = start ; i < end;i++){
          var block = await _web3dataSource.getDetailTransaction(transactionByToken[i].transactionHash);
          final String url = '${network.explorers.first.url}/api?module=account&action=${params.typeHistory}&address=$ethereumAddress&startblock=${block.blockNumber}&endblock=${block.blockNumber}&sort=desc&apikey=$apiKey"';
          final dataResponse = await dio.get(url);
          final historyTx = HistoryModel.fromJson(dataResponse.data as Map<String, dynamic>);
          transactionsHistory.addAll(historyTx.result);
        }
        return Right(transactionsHistory);
      } else {
      return Right(transactionsHistory);
    }
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
    }

}