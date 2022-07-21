import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/nft_level_up_response/nft_level_up_response.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';

abstract class LevelUpRepository{

  Future<Either<FailureMessage, NftLevelUp>> getLevel(int bedId);

  Future<Either<FailureMessage, dynamic>> postLevel(LevelUpSchema schema);
}