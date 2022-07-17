import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class ApproveUseCase extends UseCase<String, String> {
  final ISpendingRepository _iSpendingRepository;
  final IWalletRepository _iWalletRepository;

  ApproveUseCase(this._iSpendingRepository, this._iWalletRepository);

  @override
  Future<Either<FailureMessage, String>> call(String params) async {
    final currentWalletRes = await _iWalletRepository.currentWallet();
    return currentWalletRes.fold((l) {
      return Left(FailureMessage("$l"));
    }, (r) async {
      final result = await _iSpendingRepository.approve(
        owner: r.credentials,
        addressContract: params,
      );
      return result.fold((l) {
        return Left(FailureMessage("$l"));
      }, (r) {
        return Right(r);
      });
    });
  }
}
