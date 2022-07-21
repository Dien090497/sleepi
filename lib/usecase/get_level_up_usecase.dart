import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/nft_level_up_response/nft_level_up_response.dart';
import 'package:slee_fi/repository/level_up_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetLevelUpUseCase extends UseCase<NftLevelUp, int> {
  final LevelUpRepository levelUpRepository;

  GetLevelUpUseCase(this.levelUpRepository);

  @override
  Future<Either<FailureMessage, NftLevelUp>> call(int params) {
    return levelUpRepository.getLevel(params);
  }
}
