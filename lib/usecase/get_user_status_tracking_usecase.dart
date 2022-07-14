import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/usecase/usecase.dart';

class GetUserStatusTrackingUseCase
    extends UseCase<UserStatusTrackingModel, NoParams> {
  final ISleepTrackingRepository _sleepTrackingRepository;

  GetUserStatusTrackingUseCase(this._sleepTrackingRepository);

  @override
  Future<Either<Failure, UserStatusTrackingModel>> call(NoParams params) {
    return _sleepTrackingRepository.userStatusTracking();
  }
}
