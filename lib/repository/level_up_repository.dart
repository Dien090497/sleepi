import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/schema/level_up/get_level_up_schema.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';

abstract class LevelUpRepository{

  Future<Either<FailureMessage, dynamic>> getLevel(GetLevelUpSchema schema);

  Future<Either<FailureMessage, dynamic>> postLevel(LevelUpSchema schema);
}