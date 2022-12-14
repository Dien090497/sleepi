import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/response_model/response_model.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class OpenSocketUseCase extends UseCase<ResponseModel, int> {
  final IUserRepository _iUserRepository;

  OpenSocketUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, ResponseModel>> call(params) {
    return _iUserRepository.openSocket(params);
  }
}
