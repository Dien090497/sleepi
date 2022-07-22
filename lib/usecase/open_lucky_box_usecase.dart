import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/verify_response/verify_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class OpenLuckyBoxUseCase extends UseCase<VerifyResponse, int> {
  final IUserRepository _iUserRepository;

  OpenLuckyBoxUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, VerifyResponse>> call(params) {
    return _iUserRepository.openLuckyBox(params);
  }
}
