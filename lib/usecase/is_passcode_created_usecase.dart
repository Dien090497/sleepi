import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class IsPassCodeCreatedUseCase extends UseCase<bool, NoParams> {
  final IAuthRepository _authRepository;

  IsPassCodeCreatedUseCase(this._authRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return _authRepository.isPassCodeCreated();
  }
}
