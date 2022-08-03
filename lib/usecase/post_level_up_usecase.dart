import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/level_up_repository.dart';
import 'package:slee_fi/schema/level_up/level_up_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class PostLevelUpUseCase extends UseCase<BedEntity, LevelUpSchema>{

  final LevelUpRepository levelUpRepository;

  PostLevelUpUseCase(this.levelUpRepository);

  @override
  Future<Either<FailureMessage, BedEntity>> call(LevelUpSchema params) {
    return levelUpRepository.postLevel(params);
  }

}