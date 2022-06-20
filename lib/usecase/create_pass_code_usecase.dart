import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CreatePassCodeUseCase extends UseCase<bool, String> {
  final IAuthRepository _authRepository;

  CreatePassCodeUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(String params) {
    return _authRepository.createPassCode(params);
  }
}
