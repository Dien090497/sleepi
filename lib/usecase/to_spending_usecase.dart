import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ToSpendingUseCase extends UseCase<String, double> {
  final ISpendingRepository _iSpendingRepository;
  final IWalletRepository _iWalletRepository;

  ToSpendingUseCase(this._iSpendingRepository, this._iWalletRepository);

  @override
  Future<Either<Failure, String>> call(double params) async {
    final currentWalletRes = await _iWalletRepository.currentWallet();
    return currentWalletRes.fold(
      Left.new,
      (r) async {
        final result = await _iSpendingRepository.depositToken(
            amount: params, owner: r.credentials);
        return result;
      },
    );
  }
}
