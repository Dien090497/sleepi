import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ActivationCodeSettingUseCase extends UseCase {
  final IUserRepository _iUserRepository;

  ActivationCodeSettingUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, dynamic>> call(params) {
    return _iUserRepository.fetchActivationCodes();
  }
}
