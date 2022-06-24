import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetBalanceTokenUseCase extends UseCase<double, String> {
  final IWalletRepository _walletRepository;

  GetBalanceTokenUseCase(this._walletRepository);

  @override
  Future<Either<Failure, double>> call(String params) {
    return _walletRepository.getBalanceToken(params);
  }
}