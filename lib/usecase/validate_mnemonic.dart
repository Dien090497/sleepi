import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ValidateMnemonicUseCase extends UseCaseSync<bool, String> {
  final IWalletRepository _iWalletRepository;

  ValidateMnemonicUseCase(this._iWalletRepository);

  @override
  Either<FailureMessage, bool> call(params) =>
      _iWalletRepository.validateMnemonic(params);
}
