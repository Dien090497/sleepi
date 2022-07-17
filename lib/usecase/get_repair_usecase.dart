
import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/get_repair_entity/get_repair_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetRepairUseCase extends UseCase<GetRepairtEntity, num> {
  final INFTRepository _iNftRepository;

  GetRepairUseCase(this._iNftRepository);

  @override
  Future<Either<Failure, GetRepairtEntity>> call(params) {
    return _iNftRepository.getRepair(bedId: params);
  }
}

