import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNftDetailUseCase extends UseCase<BedEntity, int> {
  final INFTRepository _inftRepository;

  GetNftDetailUseCase(this._inftRepository);

  @override
  Future<Either<Failure, BedEntity>> call(int params) {
    return _inftRepository.nftDetail(params);
  }
}
