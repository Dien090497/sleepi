import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/lucky_box_response/lucky_box_response.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class OpenLuckyBoxUseCase extends UseCase<OpenLuckyBoxResponse, int> {
  final IUserRepository _iUserRepository;

  OpenLuckyBoxUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, OpenLuckyBoxResponse>> call(params) {
    return _iUserRepository.openLuckyBox(params);
  }
}
