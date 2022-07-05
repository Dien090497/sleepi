import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';

part 'nft_api.g.dart';

@Injectable()
@RestApi(baseUrl: kDebugMode ? Const.baseApiDev : Const.baseApiDev)
abstract class NftApi {
  @factoryMethod
  factory NftApi(Dio dio) {
    // dio.interceptors.add(authInterceptor);
    // dio.interceptors.add(getIt<RefreshTokenInterceptor>(param1: dio));
    return _NftApi(dio);
  }
// @GET('/nft')
// Future<SendEmailResponse> sendOTP(
//     @Query('email') String email, @Query('otpType') OTPType otpType);

}
