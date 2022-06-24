import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class CheckFirstOpenWallet extends UseCase{
  final IWalletRepository _iWalletRepository;

  CheckFirstOpenWallet(this._iWalletRepository);
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iWalletRepository.checkFirstOpenWallet();
  }
}