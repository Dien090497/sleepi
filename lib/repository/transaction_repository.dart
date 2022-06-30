import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';

abstract class ITransactionRepository {
  Future<Either<Failure, bool>> sendToExternal(SendToExternalParams params);

  Future<Either<Failure, double>> getTokenBalance();

  Future<Either<Failure, int>> calculatorFee(SendToExternalParams params);
}
