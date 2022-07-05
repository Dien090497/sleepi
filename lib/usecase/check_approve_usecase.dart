import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class CheckApproveUseCase extends UseCase<bool, CheckApproveTokenParams> {
  final IWalletRepository _iWalletRepository;

  CheckApproveUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, bool>> call(CheckApproveTokenParams params) async {
    return _iWalletRepository.checkApproveToken(
        params.value, params.contractAddress);
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
