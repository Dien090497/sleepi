import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/user/user_info_model.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SaveUserLocalUseCase extends UseCase<bool, UserInfoModel> {
  final IAuthRepository _authRepository;

  SaveUserLocalUseCase(this._authRepository);

  @override
  Future<Either<FailureMessage, bool>> call(params) {
    return _authRepository.saveUser(params);
  }
}
