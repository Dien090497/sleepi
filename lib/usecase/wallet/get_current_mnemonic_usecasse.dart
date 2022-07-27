import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class GetCurrentMnemonicUsecase extends UseCase<String, NoParams> {
  final IWalletRepository _iWalletRepository;

  GetCurrentMnemonicUsecase(this._iWalletRepository);

  @override
  Future<Either<FailureMessage, String>> call(params) =>
      _iWalletRepository.getCurrentMnemonic();
}
