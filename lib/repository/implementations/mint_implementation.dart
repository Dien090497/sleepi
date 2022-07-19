import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/mint_repository.dart';
import 'package:slee_fi/schema/minting/minting_schema.dart';

@Injectable(as: MintRepository)
class MintImplementation extends MintRepository {
  final NftApi nftApi;

  MintImplementation(this.nftApi);

  @override
  Future<Either<FailureMessage, dynamic>> getMint(int bedIdParent1,
      int bedIdParent2, double isInsurance) async {
    try {
      final result = await nftApi.getMinting(bedIdParent1, bedIdParent2, isInsurance);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> mint(MintingSchema schema) async {
    try {
      final result = await nftApi.minting(schema);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

}