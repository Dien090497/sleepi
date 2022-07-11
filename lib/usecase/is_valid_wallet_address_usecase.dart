import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/usecase.dart';
import 'package:web3dart/web3dart.dart';

class IsValidWalletAddressUseCase extends UseCaseSync<EthereumAddress, String> {
  @override
  Either<Failure, EthereumAddress> call(String params) {
    try {
      return Right(EthereumAddress.fromHex(params));
    } catch (e) {
      return const Left(FailureMessage(''));
    }
  }
}
