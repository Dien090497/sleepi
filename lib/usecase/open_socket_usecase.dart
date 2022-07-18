import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class OpenSocketUseCase extends UseCase<dynamic, int> {
  final IUserRepository _iUserRepository;

  OpenSocketUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, dynamic>> call(params) {
    return _iUserRepository.openSocket(params);
  }
}
