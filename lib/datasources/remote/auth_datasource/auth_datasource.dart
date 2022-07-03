import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/models/buy_nft_schema/buy_nft_schema.dart';
import 'package:slee_fi/models/create_password_reponse/create_password_response.dart';
import 'package:slee_fi/models/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/refresh_token_schema/refresh_token_schema.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/setting_active_code_response/setting_active_code_response.dart';
import 'package:slee_fi/models/sign_in_response/sign_in_response.dart';
import 'package:slee_fi/models/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/models/user_response/user_response.dart';
import 'package:slee_fi/models/users_response/users_response.dart';
import 'package:slee_fi/models/verify_schema/verify_schema.dart';
import 'package:slee_fi/models/verify_user_schema/verify_user_schema.dart';
import 'package:slee_fi/models/white_draw_nft_schema/whit_draw_nft_schema.dart';
import 'package:slee_fi/models/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';

part 'auth_datasource.g.dart';

@Injectable()
@RestApi(baseUrl: kDebugMode ? Const.baseApiDev : Const.baseApiDev)
abstract class AuthDataSource {
  @factoryMethod
  factory AuthDataSource(Dio dio) {
    // dio.interceptors.add(authInterceptor);
    // dio.interceptors.add(getIt<RefreshTokenInterceptor>(param1: dio));
    return _AuthDataSource(dio);
  }

  ///user
  @GET('/user-otp')
  Future<SendEmailResponse> sendOTP(
      @Query('email') String email, @Query('otpType') OTPType otpType);

  @GET('/users/balances')
  Future<dynamic> getBalance(@Query('userId') String userId);

  @GET('/users/get-global-config')
  Future<GlobalConfigResponse> getGlobalConfig();

  @GET('/users')
  Future<UsersResponse> getListUser(
      @Query('limit') int limit, @Query('offset') int offset);

  @GET('/users/{id}')
  Future<UserResponse> getUserByID(@Path('id') String userID);

  @POST('/user-otp/verify-otp')
  @Header('Content-Type: application/json')
  Future<dynamic> verifyOTP(@Body() VerifyOTPSchema verifySchema);

  @POST('/users/verify')
  @Header('Content-Type: application/json')
  Future<UserResponse> verifyUser(@Body() VerifyUserSchema verifyUserSchema);

  /// auth

  @POST('/auth/login')
  @Header('Content-Type: application/json')
  Future<SignInResponse> signIn(@Body() SignInSchema signInSchema);

  @POST('/auth/signup')
  @Header('Content-Type: application/json')
  Future<UserResponse> signUp(@Body() SignUpSchema signUpSchema);

  @POST('/auth/refresh-token')
  @Header('Content-Type: application/json')
  Future<UserResponse> refreshToken(
      @Body() RefreshTokenSchema refreshTokenSchema);

  @POST('/auth/create-password-step')
  @Header('Content-Type: application/json')
  Future<CreatePasswordResponse> createPassword(@Body() CreatePasswordSchema createPasswordSchema);

  @GET('/auth/setting-active-code')
  Future<SettingActiveCodeResponse> getSettingActiveCode();

  @GET('/auth/verify-active-code')
  Future<dynamic> verifyActiveCode(@Query('activeCode') String activeCode);

  ///stacking
  @POST('/stacking')
  @Header('Content-Type: application/json')
  Future<dynamic> stacking(@Body() CreatePasswordSchema refreshTokenSchema);

  ///white draw
  @POST('/withdraw/token')
  @Header('Content-Type: application/json')
  Future<dynamic> whitedrawToken(@Body() WhitDrawTokenSchema whitDrawTokenSchema);

  @POST('/withdraw/nft')
  @Header('Content-Type: application/json')
  Future<dynamic> whitedrawNFT(@Body() WhitDrawNFTSchema whitDrawNFTSchema);

  /// market
  @POST('/market-place/buy-nft')
  @Header('Content-Type: application/json')
  Future<dynamic> buyNFT(@Body() BuyNFTSchema buyNFTSchema);


}
