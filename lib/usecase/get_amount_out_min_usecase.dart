import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/swap_token_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetAmountOutMinUseCase extends UseCase<double, SwapTokenParams> {
  final IWalletRepository _walletRepository;

  GetAmountOutMinUseCase(this._walletRepository);

  @override
  Future<Either<Failure, double>> call(SwapTokenParams params) {
    return _walletRepository.getAmountOutMin(params.value, params.contractAddressFrom, params.contractAddressTo);
  }
}