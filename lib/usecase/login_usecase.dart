import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/sign_in_response/sign_in_response.dart';
import 'package:slee_fi/models/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class LogInUseCase extends UseCase<SignInResponse, SignInSchema> {
  final IAuthRepository _iAuthRepository;

  LogInUseCase(this._iAuthRepository);

  @override
  Future<Either<FailureMessage, SignInResponse>> call(params) {
    return _iAuthRepository.logIn(params);
  }
}
