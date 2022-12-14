import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/create_password_reponse/create_password_response.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/setting_active_code_response/setting_active_code_response.dart';
import 'package:slee_fi/schema/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';

abstract class IAuthRepository {

  Future<Either<Failure, UserInfoEntity>> getMe();

  Future<Either<Failure, UserInfoEntity>> logIn(SignInSchema signInSchema);

  Future<Either<Failure, bool>> createPassCode(String passcode);

  // Future<Either<Failure, bool>> checkPassCode(String passcode);

  Future<Either<Failure, SendEmailResponse>> sendOTPEmail(
      SendOTPParam sendOTPParam);

  Future<Either<Failure, dynamic>> verifyOTP(VerifyOTPSchema verifySchema);

  Future<Either<Failure, SettingActiveCodeResponse>> fetchSettingActiveCode();

  Future<Either<Failure, UserInfoEntity>> signUp(SignUpSchema signUpSchema);

  Future<Either<Failure, CreatePasswordResponse>> createPassword(
      CreatePasswordSchema createPasswordSchema);

  Future<Either<Failure, bool>> validatePassCode(String passcode);

  Future<Either<Failure, bool>> logOut();

  Future<Either<Failure, bool>> isPassCodeCreated();

  Future<Either<Failure, UserInfoEntity>> currentUser();

  Future<Either<Failure, bool>> checkActivationCode(String activationCode);

  Future<Either<Failure, bool>> isFirstOpenApp(String account);

  Future<Either<Failure, bool>> makeFirstOpenApp(String account);
}
