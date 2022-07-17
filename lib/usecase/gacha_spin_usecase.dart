import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/repository/gacha_repository.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GachaSpinUseCase extends UseCase<GachaSpinResponse, GachaSpinSchema> {
  final IGachaRepository _iGachaRepository;

  GachaSpinUseCase(this._iGachaRepository);

  @override
  Future<Either<Failure, GachaSpinResponse>> call(GachaSpinSchema params) {
    return _iGachaRepository.spinBonus(params);
  }
}
