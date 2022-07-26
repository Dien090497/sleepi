import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';

import 'usecase.dart';

class OpenBedBoxUseCase extends UseCase<BedEntity, int> {
  final IUserRepository _iUserRepository;

  OpenBedBoxUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, BedEntity>> call(params) {
    return _iUserRepository.openBedBox(params);
  }
}
