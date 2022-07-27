import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/nft_family/nft_family.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNftFamilyUseCase extends UseCase<List<BedEntity>, ParamsFamily> {
  final INFTRepository _inftRepository;

  GetNftFamilyUseCase(this._inftRepository);

  @override
  Future<Either<Failure, List<BedEntity>>> call(ParamsFamily params) {
    /// bedId
    return _inftRepository.fetchFamily(params: params);
  }
}

class ParamsFamily {
  final num bedId;
  final String filterType;

  ParamsFamily({required this.bedId, required this.filterType});
}
