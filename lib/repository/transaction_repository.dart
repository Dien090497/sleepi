import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';

abstract class ITransactionRepository{
  Future<Either<Failure, bool>> sendToExternal(SendToExternalParams params);
  Future<Either<Failure, double>> getTokenBalance();
  Future<Either<Failure, int>> calculatorFee(SendToExternalParams params);
}