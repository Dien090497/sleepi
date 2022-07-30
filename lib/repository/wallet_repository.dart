import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';
import 'package:slee_fi/usecase/get_balance_for_tokens_usecase.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';

abstract class IWalletRepository {
  Future<Either<Failure, WalletInfoEntity>> createWallet();

  Future<Either<Failure, bool>> hasWallet();

  Future<Either<Failure, WalletInfoEntity>> currentWallet();

  Future<Either<Failure, WalletInfoEntity>> importWallet(String mnemonic);

  Future<Either<Failure, double>> getBalanceToken(String contractAddress);

  Future<Either<Failure, double>> getAmountOutMin(
      double value, String contractAddressFrom, String contractAddressTo);

  Future<Either<Failure, bool>> approveToken(String contractAddress);

  Future<Either<Failure, BigInt>> checkAllowance(
      double value, String contractAddress);

  Future<Either<Failure, bool>> swapToken(
      double value, String contractAddressFrom, String contractAddressTo);

  Future<Either<Failure, List<double>>> getBalanceOfTokens(
      ParamsBalanceOfToken params);

  Future<Either<Failure, bool>> checkFirstOpenWallet();

  Future<Either<FailureMessage, String>> getCurrentMnemonic();

  Either<Failure, String> createNewMnemonic();

  Future<Either<FailureMessage, NetworkIsarModel>> getCurrentNetWork(
      NetWorkEnum? params);

  Future<Either<FailureMessage, NetworkIsarModel>> switchNetWork();

  Future<Either<FailureMessage, bool>> validateMnemonic(String mnemonic);

  Future<Either<Failure, List<TransactionIsarModel>>> getHistoryTransaction(
      HistoryTransactionParams params);
}
