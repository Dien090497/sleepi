import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/user_response/user_response.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SignUpUseCase extends UseCase<UserResponse, SignUpSchema> {
  final IAuthRepository _authRepository;

  SignUpUseCase(this._authRepository);

  @override
  Future<Either<FailureMessage, UserResponse>> call(params) {
    return _authRepository.signUp(params);
  }
}
