import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CheckAllowanceUseCase extends UseCase<BigInt, CheckApproveTokenParams>{
  final IWalletRepository _iWalletRepository;

  CheckAllowanceUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, BigInt>> call(CheckApproveTokenParams params) {
    return _iWalletRepository.checkAllowance(params.value, params.contractAddress);
  }
}

class CheckApproveTokenParams {
  final double value;
  final String contractAddress;

  CheckApproveTokenParams({
    required this.value,
    required this.contractAddress,
  });
}