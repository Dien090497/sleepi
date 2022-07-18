import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/level_up_repository.dart';
import 'package:slee_fi/schema/level_up/get_level_up_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetLevelUpUseCase extends UseCase<dynamic, GetLevelUpSchema> {
  final LevelUpRepository levelUpRepository;

  GetLevelUpUseCase(this.levelUpRepository);

  @override
  Future<Either<FailureMessage, dynamic>> call(GetLevelUpSchema params) {
    return levelUpRepository.getLevel(params);
  }
}
