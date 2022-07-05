import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';

abstract class ITransactionRepository {
  Future<Either<Failure, String>> sendToExternal(SendToExternalParams params);

  Future<Either<Failure, double>> getTokenBalance();

  Future<Either<Failure, int>> calculatorFee(SendToExternalParams params);

  Future<Either<FailureMessage, bool>> transferTokenErc20(SendTokenExternalParams params);
}
