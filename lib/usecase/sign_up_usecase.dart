import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SignUpUseCase extends UseCase<UserInfoEntity, SignUpSchema> {
  final IAuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<Either<FailureMessage, UserInfoEntity>> call(params) {
    return _authRepository.signUp(params);
  }
}
