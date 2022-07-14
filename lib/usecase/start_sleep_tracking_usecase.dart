import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class StartSleepTrackingUseCase extends UseCase<String, StartTrackingSchema> {
  final ISleepTrackingRepository _sleepTrackingRepository;

  StartSleepTrackingUseCase(this._sleepTrackingRepository);

  @override
  Future<Either<Failure, String>> call(params) {
    return _sleepTrackingRepository.startTracking(params);
  }
}
