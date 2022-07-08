import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetUserUseCase extends UseCase<UserInfoEntity, NoParams> {
  final IAuthRepository _authRepository;

  GetUserUseCase(this._authRepository);

  @override
  Future<Either<Failure, UserInfoEntity>> call(NoParams params) {
    return _authRepository.getMe();
  }
}
