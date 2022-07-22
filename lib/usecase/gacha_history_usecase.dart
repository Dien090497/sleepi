import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/gacha_history_response/gacha_history_response.dart';
import 'package:slee_fi/repository/gacha_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GachaHistoryUseCase extends UseCase<GachaHistoryResponse, NoParams> {
  final IGachaRepository _iGachaRepository;

  GachaHistoryUseCase(this._iGachaRepository);

  @override
  Future<Either<Failure, GachaHistoryResponse>> call(NoParams params) {
    return _iGachaRepository.getGachaHistory();
  }
}
