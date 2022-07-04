import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/spending_repository.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/to_spending_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

@injectable
class ApproveUseCase extends UseCase<String, ToSpendingParams> {
  final ISpendingRepository _iSpendingRepository;
  final IWalletRepository _iWalletRepository;

  ApproveUseCase(this._iSpendingRepository, this._iWalletRepository);

  @override
  Future<Either<FailureMessage, String>> call(ToSpendingParams params) async {
    final currentWalletRes = await _iWalletRepository.currentWallet();
    return currentWalletRes.fold((l) {
      return Left(FailureMessage("$l"));
    }, (r) async {
      final result = await _iSpendingRepository.approve(
        owner: r.credentials,
        addressContract: params.addressContract,
      );
      return result.fold((l) {
        return Left(FailureMessage("$l"));
      }, (r) {
        return Right(r);
      });
    });
  }
}

class SendTokenExternalParams {
  final double valueInEther;
  final String toAddress;
  final TokenEntity? tokenEntity;

  const SendTokenExternalParams(
      {required this.toAddress, required this.valueInEther, this.tokenEntity});
}
