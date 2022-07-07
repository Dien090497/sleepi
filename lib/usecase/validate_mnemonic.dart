import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ValidateMnemonicUseCase extends UseCase<bool, String> {
  final IWalletRepository _iWalletRepository;

  ValidateMnemonicUseCase(this._iWalletRepository);

  @override
  Future<Either<FailureMessage, bool>> call(params) =>
      _iWalletRepository.validateMnemonic(params);
}
