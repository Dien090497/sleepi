import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateTradeTokenUseCase extends UseCase<double, NoParams> {
  final ITransactionRepository _iTransactionRepository;

  EstimateTradeTokenUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, double>> call(params) {
    return _iTransactionRepository.estimateGasFeeTrade();
  }
}
