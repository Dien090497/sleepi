import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class LogOutUseCase extends UseCase{
  final IAuthRepository _authRepository;

  LogOutUseCase(this._authRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _authRepository.logOut();
  }
}
