import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateGasWithdrawUseCase
    extends UseCase<double, EstimateGasWithdrawParam> {
  final IUserRepository _iUserRepository;

  EstimateGasWithdrawUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, double>> call(params) {
    return _iUserRepository.estimateGasWithdraw(params);
  }
}

class EstimateGasWithdrawParam {
  final String type;
  final String contractAddress;

  EstimateGasWithdrawParam({required this.type, required this.contractAddress});
}
