import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/failures/failure.dart';

abstract class INFTRepository {
  Future<Either<Failure, List<NFTEntity>>> getNFTs(
      List<String> addresses, String ownerAddress);
}
