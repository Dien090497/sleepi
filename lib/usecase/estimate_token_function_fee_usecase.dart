import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/transaction_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateTokenFunctionFeeUseCase extends UseCase<double, EstimateGasTokenParams> {
  final ITransactionRepository _iTransactionRepository;

  EstimateTokenFunctionFeeUseCase(this._iTransactionRepository);

  @override
  Future<Either<Failure, double>> call(EstimateGasTokenParams params) {
    return _iTransactionRepository.estimateGasFee(
      sender: params.ownerAddress,
      value: params.value,
      to: params.toAddress,
    );
  }
}

class EstimateGasTokenParams {
  final String? ownerAddress;
  final String toAddress;
  final double? value;

  EstimateGasTokenParams({
    this.ownerAddress,
    required this.toAddress,
    required this.value,
  });
}
