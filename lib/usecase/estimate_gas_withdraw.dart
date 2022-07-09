import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class EstimateGasWithdraw extends UseCase<double, EstimateGasWithdrawParam> {
  final IUserRepository _iUserRepository;

  EstimateGasWithdraw(this._iUserRepository);

  @override
  Future<Either<Failure, double>> call(params) {
    return _iUserRepository.estimateGasWithdraw(params);
  }
}

class EstimateGasWithdrawParam {
  final String type;
  final String contractAddress;
  final String tokenId;
  final String amount;

  EstimateGasWithdrawParam({
    required this.type,
    required this.contractAddress,
    required this.tokenId,
    required this.amount,
  });
}
