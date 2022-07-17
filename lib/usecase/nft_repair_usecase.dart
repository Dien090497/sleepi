
import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/schema/repair_schema/repair_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class NFTRepairUseCase extends UseCase<dynamic, RepairSchema> {
  final INFTRepository _iNftRepository;

  NFTRepairUseCase(this._iNftRepository);

  @override
  Future<Either<Failure, dynamic>> call(params) {
    return _iNftRepository.nftRepair(repairSchema: params);
  }
}

