import 'package:dartz/dartz.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class INFTRepository {
  Future<Either<Failure, BigInt>> balanceOf(
      String address, String ownerAddress);

  Future<Either<Failure, List<BigInt>>> tokensOf(
      {required String nftAddress,
      required String ownerAddress,
      required int count,
      required int start});

  Future<Either<Failure, List<NFTEntity>>> getListNftData({
    required List<BigInt> tokenIds,
    required NftType nftType,
    int? page,
    int? limit,
  });
}
