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
    final listIds = await _nftRepository.tokensOf(
        nftAddress: params.address,
        ownerAddress: params.ownerAddress,
        count: params.count,
        start: params.start);
    return listIds.fold(
      Left.new,
      (ids) {
        return _nftRepository.getListNftData(
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
  final String address;
  final int count;
  final int start;

  GetListNftDetailParams({
    required this.ownerAddress,
    required this.address,
    required this.nftType,
    required this.count,
    this.start = 0,
  });
}
