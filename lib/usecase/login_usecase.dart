import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class LogInUseCase extends UseCase<UserInfoEntity, SignInSchema> {
  final IAuthRepository _iAuthRepository;

  LogInUseCase(this._iAuthRepository);

  @override
  Future<Either<Failure, UserInfoEntity>> call(params) {
    return _iAuthRepository.logIn(params);
  }
}
