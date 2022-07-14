import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/lucky_box/lucky_box.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class FetchLuckyBoxUseCase extends UseCase<List<LuckyBox>, dynamic> {
  final IUserRepository _iUserRepository;

  FetchLuckyBoxUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, List<LuckyBox>>> call(params) {
    return _iUserRepository.fetchLuckyBox();
  }
}
