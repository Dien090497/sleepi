import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class ActivationCodeSettingUseCase
    extends UseCase<List<ActiveCodeEntity>, dynamic> {
  final IUserRepository _iUserRepository;

  ActivationCodeSettingUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<ActiveCodeEntity>>> call(params) =>
      _iUserRepository.fetchActivationCodes();
}
