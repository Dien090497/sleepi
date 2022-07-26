import 'package:dartz/dartz.dart';

import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';

import 'usecase.dart';

class OpenBedBoxUseCase extends UseCase<dynamic, int> {
  final IUserRepository _iUserRepository;

  OpenBedBoxUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, dynamic>> call(params) {
    return _iUserRepository.openBedBox(params);
  }
}
