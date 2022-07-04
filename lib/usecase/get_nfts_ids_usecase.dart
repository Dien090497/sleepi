import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNFTsIDsUseCase extends UseCase<List<BigInt>, GetNFTsIDsParams> {
  final INFTRepository _nftRepository;

  GetNFTsIDsUseCase(this._nftRepository);

  @override
  Future<Either<Failure, List<BigInt>>> call(GetNFTsIDsParams params) {
    return _nftRepository.tokensOf(
        nftAddress: params.nftAddress,
        ownerAddress: params.ownerAddress,
        count: params.count,
        start: params.start);
  }
}

class GetNFTsIDsParams {
  final String nftAddress;
  final String ownerAddress;
  final int count;
  final int start;

  GetNFTsIDsParams({
    required this.nftAddress,
    required this.ownerAddress,
    required this.count,
    this.start = 0,
  });
}
