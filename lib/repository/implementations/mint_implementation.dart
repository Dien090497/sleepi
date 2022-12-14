import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/minting/info_minting_model.dart';
import 'package:slee_fi/models/minting/minting_model.dart';
import 'package:slee_fi/repository/mint_repository.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';

@Injectable(as: MintRepository)
class MintImplementation extends MintRepository {
  final NftApi nftApi;

  MintImplementation(this.nftApi);

  @override
  Future<Either<FailureMessage, InfoMintingModel>> getMint(int bedIdParent1,
      int bedIdParent2) async {
    try {
      final result = await nftApi.getMinting(bedIdParent1, bedIdParent2);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, MintingModel>> mint(MintingSchema schema) async {
    try {
      final result = await nftApi.minting(schema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

}