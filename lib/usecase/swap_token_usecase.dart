import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/wallet_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SwapTokenUseCase extends UseCase<String, SwapTokenParams> {
  final IWalletRepository _iWalletRepository;

  SwapTokenUseCase(this._iWalletRepository);

  @override
  Future<Either<Failure, String>> call(SwapTokenParams params) {
    return _iWalletRepository.swapToken(
        params.value, params.contractAddressFrom, params.contractAddressTo);
  }
}

class SwapTokenParams {
  final double value;
  final String contractAddressFrom;
  final String contractAddressTo;

  SwapTokenParams({
    required this.value,
    required this.contractAddressFrom,
    required this.contractAddressTo,
  });
}
