import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetGlobalConfigUseCase extends UseCase<GlobalConfigResponse, NoParams> {
  final IUserRepository _iUserRepository;

  GetGlobalConfigUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, GlobalConfigResponse>> call(params) {
    return _iUserRepository.getGlobalConfig();
  }
}
