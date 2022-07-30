import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class ApproveUseCase extends UseCase<bool, String> {
  final IWalletRepository _iWalletRepository;

  ApproveUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, bool>> call(String params) async {
    return _iWalletRepository.approveToken(params);
  }
}
