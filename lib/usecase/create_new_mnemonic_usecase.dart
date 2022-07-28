import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CreateNewMnemonicUseCase extends UseCaseSync<String, NoParams> {
  final IWalletRepository _walletRepository;

  CreateNewMnemonicUseCase(this._walletRepository);

  @override
  Either<Failure, String> call(NoParams params) {
    return _walletRepository.createNewMnemonic();
  }
}
