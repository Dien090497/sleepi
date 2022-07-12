import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class HasWalletUseCase extends UseCase<bool, NoParams> {
  final IWalletRepository _walletRepository;

  HasWalletUseCase(this._walletRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _walletRepository.hasWallet();
  }
}
