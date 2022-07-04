import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class MakeFirstOpenAppUseCase extends UseCase<bool, dynamic>{
  final IAuthRepository _authRepository;

  MakeFirstOpenAppUseCase(this._authRepository);
  @override
  Future<Either<Failure, bool>> call(params) {
    return _authRepository.makeFirstOpenApp();
  }

}