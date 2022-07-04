import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CheckActivationCodeUseCase extends UseCase<bool, String> {
  final IAuthRepository _iAuthRepository;

  CheckActivationCodeUseCase(this._iAuthRepository);

  @override
  Future<Either<Failure, bool>> call(params) {
    return _iAuthRepository.checkActivationCode(params);
  }
}
