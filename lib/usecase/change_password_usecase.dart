import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ChangePasswordUseCase extends UseCase<dynamic, ChangePasswordSchema> {
  final IUserRepository _iUserRepository;

  ChangePasswordUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, dynamic>> call(params) {
    return _iUserRepository.changePassword(params);
  }
}
