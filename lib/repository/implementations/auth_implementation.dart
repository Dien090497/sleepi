import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';

@Injectable(as: IAuthRepository)
class AuthImplementation extends IAuthRepository {
  @override
  Future<Either<Failure, String>> logIn() async {
    try {
      return const Right('');
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
