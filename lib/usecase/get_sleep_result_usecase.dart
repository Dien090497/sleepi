import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetSleepResultUseCase extends UseCase<String, int> {
  final ISleepTrackingRepository _sleepTrackingRepository;

  GetSleepResultUseCase(this._sleepTrackingRepository);

  @override
  Future<Either<Failure, String>> call(int params) {
    return _sleepTrackingRepository.getResult(params);
  }
}
