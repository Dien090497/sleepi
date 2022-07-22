import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_probability_config_response/gacha_probability_config_response.dart';
import 'package:slee_fi/repository/gacha_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GachaProbabilityConfigUseCase extends UseCase<GachaProbabilityConfigResponse, NoParams> {
  final IGachaRepository _iGachaRepository;

  GachaProbabilityConfigUseCase(this._iGachaRepository);

  @override
  Future<Either<Failure, GachaProbabilityConfigResponse>> call(NoParams params) {
    return _iGachaRepository.getProbabilityConfig();
  }
}
