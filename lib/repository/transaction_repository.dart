import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';

abstract class ITransactionRepository {
  Future<Either<Failure, String>> sendToExternal(SendToExternalParams params);

  Future<Either<Failure, double>> getTokenBalance(SendToExternalParams params);

  Future<Either<Failure, String>> getCurrentNetworkExplorer();

  Future<Either<Failure, double>> estimateGasFee({
    String? sender,
    String? to,
    double? value,
  });

  Future<Either<Failure, double>> estimateGasFeeTrade();

  Future<Either<Failure, int>> calculatorFee(SendToExternalParams params);

  Future<Either<FailureMessage, String>> transferTokenErc20(
      SendTokenExternalParams params);
}
