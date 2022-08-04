import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateGasDepositUseCase
    extends UseCase<double, EstimateGasDepositParam> {
  final ISpendingRepository _iSpendingRepository;

  EstimateGasDepositUseCase(this._iSpendingRepository);

  @override
  Future<Either<FailureMessage, double>> call(params) {
    return _iSpendingRepository.estimateGas(params: params);
  }
}

class EstimateGasDepositParam {
  final String functionName;
  final List<dynamic> data;

  EstimateGasDepositParam({required this.functionName, required this.data,});
}
