import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> logIn();
  Future<Either<Failure, bool>> createPassCode(String passcode);
}
