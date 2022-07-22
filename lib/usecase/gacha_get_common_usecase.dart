import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/repository/gacha_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GachaGetCommonUseCase extends UseCase<GachaSpinResponse, NoParams> {
  final IGachaRepository _iGachaRepository;

  GachaGetCommonUseCase(this._iGachaRepository);

  @override
  Future<Either<Failure, GachaSpinResponse>> call(NoParams params) {
    return _iGachaRepository.gachaGetCommon();
  }
}
