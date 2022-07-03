import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/transfer_spending_entity/transfer_spending_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ToSpendingUseCase extends UseCase<TransferSpendingEntity, ToSpendingParams> {
  final ISpendingRepository _iSpendingRepository;
  final IWalletRepository _iWalletRepository;

  ToSpendingUseCase(this._iSpendingRepository, this._iWalletRepository);

  @override
  Future<Either<Failure, TransferSpendingEntity>> call(ToSpendingParams params) async {
    final currentWalletRes = await _iWalletRepository.currentWallet();
    return currentWalletRes.fold(
      Left.new,
      (r) async {
        final result = await _iSpendingRepository.depositToken(
          amount: params.amount,
          owner: r.credentials,
          addressContract: params.addressContract,
        );
        return result;
      },
    );
  }
}

class ToSpendingParams {
  final double amount;
  final String addressContract;

  ToSpendingParams({required this.amount, required this.addressContract});
}
