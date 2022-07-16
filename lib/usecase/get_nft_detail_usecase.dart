import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_detail_entity/nft_detail_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNftDetailUseCase extends UseCase<NftDetailEntity, int> {
  final INFTRepository _inftRepository;

  GetNftDetailUseCase(this._inftRepository);

  @override
  Future<Either<Failure, NftDetailEntity>> call(int params) {
    return _inftRepository.nftDetail(params);
  }
}
