import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_interceptor.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/refresh_token_interceptor.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/list_nft_data_model/list_nft_data_model.dart';

part 'sleep_tracking_api.g.dart';

@Injectable()
@RestApi(baseUrl: kDebugMode ? Const.baseApiDev : Const.baseApiDev)
abstract class SleepTrackingApi {
  @factoryMethod
  factory SleepTrackingApi(Dio dio, AuthInterceptor authInterceptor,
      RefreshTokenInterceptor refreshInterceptor) {
    dio.interceptors.addAll([
      authInterceptor,
      refreshInterceptor,
    ]);
    return _SleepTrackingApi(dio);
  }

  @GET('/tracking/estimate-tracking')
  Future<ListNftDataModel> estimateTracking(
    @Query('bedUsed') int bedId,
    @Query('itemUsed') int? itemId,
    @Query('isEnableInsurance') bool isEnableInsurance,
  );

  @GET('/tracking/estimate-tracking')
  Future<EstimateSleepResponse> estimateSleepEarn(
    @Query('bedUsed') int bedId,
    @Query('itemUsed') int itemId,
    @Query('isEnableInsurance') bool enableInsurance,
  );
}
