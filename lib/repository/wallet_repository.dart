import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';

abstract class IWalletRepository {
  Future<Either<Failure, WalletInfoEntity>> createWallet();

  Future<Either<Failure, WalletInfoEntity>> currentWallet();

  Future<Either<Failure, WalletInfoEntity>> importWallet(String mnemonic);

  Future<Either<Failure, double>> getBalanceToken(String contractAddress);

  Future<Either<Failure, double>> getAmountOutMin(
      double value, String contractAddressFrom, String contractAddressTo);

  Future<Either<Failure, bool>> swapToken(
      double value, String contractAddressFrom, String contractAddressTo);

  Future<Either<Failure, List<double>>> getBalanceOfTokens(
      ParamsBalanceOfToken params);

  Future<Either<Failure, bool>> checkFirstOpenWallet();

  Future<Either<FailureMessage, String>> getCurrentMnemonic();

  Future<Either<FailureMessage, NetworkIsarModel>> getCurrentNetWork(
      NetWorkEnum? params);

  Future<Either<FailureMessage, NetworkIsarModel>> switchNetWork();
}