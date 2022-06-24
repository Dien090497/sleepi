import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/get_balance_token_usecase.dart';

abstract class IWalletRepository {
  Future<Either<Failure, WalletInfoEntity>> createWallet();

  Future<Either<Failure, WalletInfoEntity>> currentWallet();

  Future<Either<Failure, WalletInfoEntity>> importWallet(String mnemonic);

  Future<Either<Failure, bool>> swapToken();

  Future<Either<Failure, List<double>>> getBalanceOfToken(
      ParamsBalanceOfToken params);

  Future<Either<Failure, bool>> checkFirstOpenWallet();
  Future<Either<FailureMessage, String>> getCurrentMnemonic();
}
