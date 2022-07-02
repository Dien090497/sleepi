import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';

abstract class IAuthRepository {
  Future<Either<Failure, String>> logIn();
  Future<Either<Failure, bool>> createPassCode(String passcode);
  Future<Either<Failure, bool>> checkPassCode(String passcode);
  Future<Either<FailureMessage, SendEmailResponse>> sendOTPEmail(SendOTPParam sendOTPParam);
  Future<Either<FailureMessage, dynamic>> verifyOTP(VerifyOTPSchema verifySchema);
}
