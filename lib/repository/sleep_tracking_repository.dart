import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';
import 'package:slee_fi/schema/wake_up/wake_up_schema.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';

abstract class ISleepTrackingRepository {

  Future<Either<Failure, dynamic>> postDataHealth(DataHealthSchema schema);

  Future<Either<FailureMessage, String>> startTracking(StartTrackingSchema schema);

  Future<Either<FailureMessage, EstimateSleepResponse>> estimateTracking(
      EstimateTrackingParam estimateTrackingParam);

  Future<Either<FailureMessage, String>> getResult(int id);

  Future<Either<FailureMessage, String>> wakeUp(WakeUpSchema schema);

  Future<Either<FailureMessage, UserStatusTrackingModel>> userStatusTracking();
}
