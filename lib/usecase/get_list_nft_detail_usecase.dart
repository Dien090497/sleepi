import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetListNftDetailUseCase
    extends UseCase<List<NFTEntity>, GetListNftDetailParams> {
  final INFTRepository _nftRepository;

  GetListNftDetailUseCase(this._nftRepository);

  @override
  Future<Either<Failure, List<NFTEntity>>> call(
      GetListNftDetailParams params) async {
    final listIdsRes = await _nftRepository.tokensOf(
      nftAddress: params.nftAddress,
      ownerAddress: params.ownerAddress,
    );
    return listIdsRes.fold(
      Left.new,
      (ids) {
        return _nftRepository.getListNftData(
          nftAddress: params.nftAddress,
          tokenIds: ids,
          nftType: params.nftType,
        );
      },
    );
  }
}

class GetListNftDetailParams {
  final NftType nftType;
  final String ownerAddress;
  final String nftAddress;

  GetListNftDetailParams({
    required this.ownerAddress,
    required this.nftAddress,
    required this.nftType,
  });
}
