import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/gacha_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GachaGetSpecialUseCase extends UseCase<dynamic, NoParams> {
  final IGachaRepository _iGachaRepository;

  GachaGetSpecialUseCase(this._iGachaRepository);

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    return _iGachaRepository.gachaGetSpecial();
  }
}
