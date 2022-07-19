import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_model.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';

abstract class ISleepTrackingRepository {

  Future<Either<FailureMessage, dynamic>> postDataHealth(DataHealthSchema schema);

  Future<Either<FailureMessage, dynamic>> startTracking(StartTrackingSchema schema);

  Future<Either<FailureMessage, EstimateSleepResponse>> estimateTracking(
      EstimateTrackingParam estimateTrackingParam);

  Future<Either<FailureMessage, String>> getResult(int id);

  Future<Either<FailureMessage, TrackingResultModel>> wakeUp(DataHealthSchema schema);

  Future<Either<FailureMessage, UserStatusTrackingModel>> userStatusTracking();
}
