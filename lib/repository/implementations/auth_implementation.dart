import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/entities/user/user.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';

@Injectable(as: IAuthRepository)
class AuthImplementation extends IAuthRepository {
  @override
  Future<Either<Failure, User>> logIn() async {
    try {
      return const Right(User(name: 'Kevin', age: 100));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
