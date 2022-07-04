import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class IsFirstOpenAppUseCase extends UseCase{
  final IAuthRepository _authRepository;

  IsFirstOpenAppUseCase(this._authRepository);
  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _authRepository.isFirstOpenApp();
  }


}