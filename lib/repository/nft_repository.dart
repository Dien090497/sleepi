import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class INFTRepository {
  Future<Either<Failure, List<NFTEntity>>> balanceOf(
      List<String> addresses, String ownerAddress);

  Future<Either<Failure, List<BigInt>>> tokensOf(
      {required String nftAddress,
      required String ownerAddress,
      required int count,
      required int start});
}
