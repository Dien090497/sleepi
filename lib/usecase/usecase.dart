import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class UseCaseSync<T, Params> {
  Either<Failure, T> call(Params params);
}

class NoParams {}