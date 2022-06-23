import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class ITransactionRepository{
  Future<Either<Failure, SendToExternalEntity>> sendToExternal();
}