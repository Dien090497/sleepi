import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class ISpendingRepository {
  Future<Either<Failure, String>> depositToken(int amount);
}