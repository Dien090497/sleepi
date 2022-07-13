import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class HistoryTransactionParams {
  final String? typeHistory;
  final String? tokenSymbol;
  final int? page;

  const HistoryTransactionParams({this.tokenSymbol, this.typeHistory, this.page});
}

class GetHistoryTransactionUseCase extends UseCase<List<TransactionIsarModel>, HistoryTransactionParams> {
  final IWalletRepository _walletRepository;

  GetHistoryTransactionUseCase(this._walletRepository);

  @override
  Future<Either<Failure, List<TransactionIsarModel>>> call(HistoryTransactionParams params) {
    return _walletRepository.getHistoryTransaction(params);
  }
}