import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class CurrentUserUseCase extends UseCase<UserInfoEntity,dynamic > {
  final IAuthRepository _iAuthRepository;

  CurrentUserUseCase(this._iAuthRepository);

  @override
  Future<Either<FailureMessage, UserInfoEntity>> call(params) {
    return _iAuthRepository.currentUser();
  }
}
