import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_family/nft_family.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNftFamilyUseCase extends UseCase<NftFamilyEntity, int> {
  final INFTRepository _inftRepository;

  GetNftFamilyUseCase(this._inftRepository);

  @override
  Future<Either<Failure, NftFamilyEntity>> call(int params) {
    /// bedId
    return _inftRepository.fetchFamily(params);
  }
}
