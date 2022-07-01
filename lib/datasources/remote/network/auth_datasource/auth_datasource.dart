import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/verify_schema/verify_schema.dart';

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

  @GET('/user-otp')
  Future<SendEmailResponse> sendOTP(
      @Query('email') String email, @Query('otpType') OTPType otpType);

  @POST('/user-otp/verify-otp')
  @Header('Content-Type: application/json')
  Future<dynamic> verifyOTP(@Body() VerifySchema verifySchema);


// @POST("signup")
// Future<PostSignUpResponse> signUp(@Body() SignUpSchema schema);
//
// @POST("verify")
// Future<VerifySignUpResponse> verifySignUp(@Body() VerifySignUpSchema schema);
//
// @POST("signin")
// Future<SignInResponse> signIn(@Body() SignInSchema schema);
//
// @POST("signup-google")
// Future<PostSignUpResponse> signUpGoogle(@Body() SignUpGoogleSchema schema);
//
// @POST('resend-code')
// Future<PostResponseMessage> requestOTP(@Body() RequestOTPSchema schema);
//
// @POST('change-password')
// Future<PostResponseMessage> changePassword(
//     @Body() ChangePasswordSchema schema);
//
// @POST("signup-facebook")
// Future<PostSignUpResponse> signupFaceBook(
//     @Body() SignUpFaceBookSchema schema);
//
// @POST("signin-google")
// Future<VerifySignUpResponse> signInGoogle(
//     @Body() SignInWithGoogleSchema token);
//
// @POST("forgot-password")
// Future<PostSignUpResponse> forgotPassword(
//     @Body() ForgotPasswordSchema username);
//
// @POST("check-code")
// Future<PostResponseMessage> checkOtpCode(
//     @Body() CheckOtpCodeSchema checkOtpCodeSchema);
//
// @POST("reset-password")
// Future<PostResponseMessage> resetPassword(
//     @Body() ResetPasswordSchema resetPasswordSchema);
//
// @POST("signin-facebook")
// Future<VerifySignUpResponse> signinFaceBook(
//     @Body() SignInWithFaceBookSchema schema);
}
