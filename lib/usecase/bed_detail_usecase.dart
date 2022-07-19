import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class BedDetailUseCase extends UseCase<BedEntity, BedDetailParams> {
  final IUserRepository _iUserRepository;

  BedDetailUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, BedEntity>> call(BedDetailParams params) {
    return _iUserRepository.bedDetail(params.bedId, params.isBase);
  }
}

class BedDetailParams {
  final int bedId;
  final bool isBase;

  BedDetailParams({required this.bedId, this.isBase = false});
}
