import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/schema/wake_up/wake_up_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class WakeUpUseCase extends UseCase<String, WakeUpSchema> {
  final ISleepTrackingRepository _sleepTrackingRepository;

  WakeUpUseCase(this._sleepTrackingRepository);

  @override
  Future<Either<Failure, String>> call(WakeUpSchema params) {
    return _sleepTrackingRepository.wakeUp(params);
  }
}
