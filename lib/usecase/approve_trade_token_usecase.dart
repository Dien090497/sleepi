import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ApproveTradeTokenUseCase extends UseCase<String, String> {
  final IWalletRepository _iWalletRepository;

  ApproveTradeTokenUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, String>> call(String params) async {
    return _iWalletRepository.approveToken(params);
  }
}
