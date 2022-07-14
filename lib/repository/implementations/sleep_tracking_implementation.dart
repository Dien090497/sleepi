import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/sleep_tracking_api/sleep_tracking_api.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';

@Injectable(as: ISleepTrackingRepository)
class SleepTrackingImplementation extends ISleepTrackingRepository {
  final SleepTrackingApi _sleepTrackingApi;

  SleepTrackingImplementation(this._sleepTrackingApi);

  @override
  Future<Either<Failure, String>> estimateTracking({
    required int bedId,
    required int? itemId,
    required bool isEnableInsurance,
  }) async {
    try {
      await _sleepTrackingApi.estimateTracking(
          bedId, itemId, isEnableInsurance);
      return Right('');
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
