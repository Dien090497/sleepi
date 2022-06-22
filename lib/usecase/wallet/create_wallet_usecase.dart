import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CreateWalletUseCase extends UseCase<WalletInfoEntity, NoParams> {
  final IWalletRepository _iWalletRepository;

  CreateWalletUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, WalletInfoEntity>> call(NoParams params) {
    return _iWalletRepository.createWallet();
  }
}
