import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class IsTokenApprovedEnoughUseCase
    extends UseCase<bool, IsTokenApprovedParams> {
  final ISpendingRepository _spendingRepository;

  IsTokenApprovedEnoughUseCase(this._spendingRepository);

  @override
  Future<Either<Failure, bool>> call(IsTokenApprovedParams params) {
    return _spendingRepository.isAllowanceEnough(
      ownerAddress: params.ownerAddress,
      tokenAddress: params.tokenAddress,
      amount: params.amount,
    );
  }
}

class IsTokenApprovedParams {
  final String ownerAddress;
  final String tokenAddress;
  final double amount;

  IsTokenApprovedParams({
    required this.ownerAddress,
    required this.tokenAddress,
    required this.amount,
  });
}
