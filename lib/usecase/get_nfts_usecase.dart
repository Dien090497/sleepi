import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/nft_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetNFTsUseCase extends UseCase<List<NFTEntity>, GetNFTsParams> {
  final INFTRepository _nftRepo;

  GetNFTsUseCase(this._nftRepo);

  @override
  Future<Either<Failure, List<NFTEntity>>> call(GetNFTsParams params) {
    return _nftRepo.getNFTs(params.addresses, params.ownerAddress);
  }
}

class GetNFTsParams {
  final String ownerAddress;
  final List<String> addresses;

  GetNFTsParams(this.ownerAddress, this.addresses);
}
