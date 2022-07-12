import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/sleep_tracking_api/sleep_tracking_api.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/sleep_tracking_repository.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';
import 'package:slee_fi/schema/wake_up/wake_up_schema.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';

@Injectable(as: ISleepTrackingRepository)
class SleepTrackingImplementation extends ISleepTrackingRepository {
  final SleepTrackingApi _sleepTrackingApi;
  final AuthDataSource _authDataSource;

  SleepTrackingImplementation(this._sleepTrackingApi, this._authDataSource);

  @override
  Future<Either<FailureMessage, EstimateSleepResponse>> estimateTracking(
      EstimateTrackingParam estimateTrackingParam) async {
    try {
      var result = await _sleepTrackingApi.estimateSleepEarn(
          estimateTrackingParam.bedId,
          estimateTrackingParam.itemId,
          estimateTrackingParam.isEnableInsurance);

      return Right(result);
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, String>> getResult(int id) async {
    try {
      return Right(await _sleepTrackingApi.getResult(id));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, String>> startTracking(
      StartTrackingSchema schema) async {
    try {
      return Right(await _sleepTrackingApi.startTracking(schema));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, UserStatusTrackingModel>>
      userStatusTracking() async {
    try {
      return Right(await _sleepTrackingApi.userStatusTracking());
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, String>> wakeUp(WakeUpSchema schema) async {
    try {
      return Right(await _sleepTrackingApi.wakeUp(schema));
    } catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<Failure, dynamic>> postDataHealth(DataHealthSchema schema) async {
    try{
      final result = await _authDataSource.postHealthData(schema);
      return Right(result);
    }catch(e){
      return Left(FailureMessage('$e'));
    }
  }
}