import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_interceptor.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/refresh_token_interceptor.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_model.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';

part 'sleep_tracking_api.g.dart';

@Injectable()
@RestApi()
abstract class SleepTrackingApi {
  @factoryMethod
  factory SleepTrackingApi(
    Dio dio,
    AuthInterceptor authInterceptor,
    RefreshTokenInterceptor refreshInterceptor,
    @Named('baseUrl') String baseUrl,
  ) {
    dio.interceptors.addAll([
      authInterceptor,
      refreshInterceptor,
    ]);
    return _SleepTrackingApi(dio, baseUrl: baseUrl);
  }

  @POST('/tracking')
  Future<dynamic> startTracking(@Body() StartTrackingSchema schema);

  @GET('/tracking/estimate-tracking')
  Future<EstimateSleepResponse> estimateSleepEarn(
    @Query('bedUsed') int bedId,
    @Query('itemUsed') int? itemId,
    @Query('isEnableInsurance') bool enableInsurance,
  );

  @GET('/tracking/estimate-tracking')
  Future<EstimateSleepResponse> estimateSleepEarns(
    @Query('bedUsed') int bedId,
    @Query('isEnableInsurance') bool enableInsurance,
  );

  @GET('/tracking/tracking-result/{id}')
  Future<String> getResult(@Path('id') int id);

  @POST('/tracking/wake-up')
  Future<TrackingResultModel> wakeUp(@Body() DataHealthSchema dataHealthSchema);

  @GET('/tracking/user-status-tracking')
  Future<UserStatusTrackingModel> userStatusTracking();

  @POST('/health-app')
  Future<dynamic> postHealthData(@Body() DataHealthSchema dataHealthSchema);
}
