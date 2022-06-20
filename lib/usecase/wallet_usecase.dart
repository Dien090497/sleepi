import 'package:dartz/dartz.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/implementations/wallet_implementation.dart';
import 'package:slee_fi/usecase/usecase.dart';

class WalletUseCase extends UseCase<int ,String> {
  @override
  Future<Either<Failure, int>> call(String params) {
    return getIt<WalletImplementation>().currentWalletInfo();
  }
}
