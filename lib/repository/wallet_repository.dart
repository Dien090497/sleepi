import 'package:dartz/dartz.dart';

import '../failures/failure.dart';

abstract class IWalletRepository {
  Future<Either<Failure, int>> currentWalletInfo();

  Future<Either<Failure, int>> createWallet(String address);

  Future<Either<Failure, int>> importSeedPhrase(String address);

  Future<Either<Failure, bool>> switchNetwork(String address);

  Future<Either<Failure, bool>> createPasscode(String passcode);

  Future<Either<Failure, bool>> verifyPasscode(String passcode);
}
