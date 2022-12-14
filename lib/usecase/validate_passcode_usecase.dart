import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ValidatePassCodeUseCase extends UseCase<bool, String> {
  final IAuthRepository _authRepository;

  ValidatePassCodeUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(String params) {
    return _authRepository.validatePassCode(params);
  }
}
