import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/nft_api/nft_api.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/nft_level_up_response/nft_level_up_response.dart';
import 'package:slee_fi/repository/level_up_repository.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';

@Injectable(as: LevelUpRepository)
class LevelUpImplementation extends LevelUpRepository {
  final NftApi nftApi;

  LevelUpImplementation(this.nftApi);

  @override
  Future<Either<FailureMessage, NftLevelUp>> getLevel(int bedId) async {
    try {
      final result = await nftApi.getLevelUp(bedId);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, BedEntity>> postLevel(
      LevelUpSchema schema) async {
    try {
      final result = await nftApi.levelUp(schema);
      return Right(result.toEntity());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
