import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/network/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/verify_schema/verify_schema.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';

@Injectable(as: IAuthRepository)
class AuthImplementation extends IAuthRepository {
  final SecureStorage _secureStorage;
  final AuthDataSource _authDataSource;

  AuthImplementation(this._secureStorage, this._authDataSource);

  @override
  Future<Either<Failure, bool>> createPassCode(String passcode) async {
    assert(passcode.isNotEmpty && passcode.length == 6,
        'Pass Code must not be empty');
    try {
      await _secureStorage.writePassCode(passcode);
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, String>> logIn() async {
    try {
      return const Right('');
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> validatePassCode(String passcode) async {
    try {
      String? pass = await _secureStorage.readPassCode();
      if (pass == null) {
        await _secureStorage.writePassCode(passcode);
        return const Right(true);
      }
      log('passcode: $pass');
      return Right(passcode == pass);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, SendEmailResponse>> sendOTPEmail(
      SendOTPParam sendOTPParam) async {
    try {
      var result = await _authDataSource.sendOTP(
          sendOTPParam.email, sendOTPParam.otpType);
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> verifyOTP(
      VerifyOTPSchema verifySchema) async {
    try {
      var result = await _authDataSource.verifyOTP(verifySchema);
      return Right(result);
    } catch (e) {
      'error import wallet $e'.log;
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<Failure, bool>> isPassCodeCreated() async {
    try {
      return Right((await _secureStorage.hasPassCode()));
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
