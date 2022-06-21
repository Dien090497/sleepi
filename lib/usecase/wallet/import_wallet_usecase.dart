import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/implementations/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ImportWalletUseCase extends UseCase<WalletInfoEntity, String> {
  final IWalletRepository _iWalletRepository;

  ImportWalletUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, WalletInfoEntity>> call(String params) {
    return _iWalletRepository.importWallet(params);
  }
}
