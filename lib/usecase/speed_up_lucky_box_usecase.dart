import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/speed_up_lucky_box_schema/speed_up_lucky_box_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SpeedUpLuckyBoxUseCase extends UseCase<dynamic, SpeedUpLuckyBoxSchema> {
  final IUserRepository _iUserRepository;

  SpeedUpLuckyBoxUseCase(this._iUserRepository);

  @override
  Future<Either<FailureMessage, dynamic>> call(params) {
    return _iUserRepository.speedUpLuckyBox(params);
  }
}
