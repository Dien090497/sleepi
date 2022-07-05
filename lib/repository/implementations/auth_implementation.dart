import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/datasources/local/get_storage_datasource.dart';
import 'package:slee_fi/datasources/local/isar/isar_datasource.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/create_password_reponse/create_password_response.dart';
import 'package:slee_fi/models/send_email_response/send_email_response.dart';
import 'package:slee_fi/models/setting_active_code_response/setting_active_code_response.dart';
import 'package:slee_fi/models/sign_in_response/sign_in_response.dart';
import 'package:slee_fi/models/user/user_info_model.dart';
import 'package:slee_fi/models/user_response/user_response.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/schema/create_password_schema/create_password_schema.dart';
import 'package:slee_fi/schema/sign_in_schema/sign_in_schema.dart';
import 'package:slee_fi/schema/sign_up_schema/sign_up_schema.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';

@Injectable(as: IAuthRepository)
class AuthImplementation extends IAuthRepository {
  final SecureStorage _secureStorage;
  final AuthDataSource _authDataSource;
  final IsarDataSource _isarDataSource;
  final GetStorageDataSource _getStorageDataSource;

  AuthImplementation(this._secureStorage, this._authDataSource,
      this._isarDataSource, this._getStorageDataSource);

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
  Future<Either<FailureMessage, SignInResponse>> logIn(
      SignInSchema signInSchema) async {
    try {
      var result = await _authDataSource.signIn(signInSchema);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
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
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, dynamic>> verifyOTP(
      VerifyOTPSchema verifySchema) async {
    try {
      var result = await _authDataSource.verifyOTP(verifySchema);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
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

  @override
  Future<Either<Failure, bool>> logOut() async {
    try {
      var isFirstOpen = false;
      var result = await isFirstOpenApp();
      result.fold((l) => null, (r) {
       isFirstOpen = !r;
      });
      await Future.wait([
        _secureStorage.clearStorage(),
        _isarDataSource.clearWallet(),
        _getStorageDataSource.clearAll(),
      ]);
      if (isFirstOpen) {
        _secureStorage.makeFirstOpen();
      }

      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, SettingActiveCodeResponse>>
      fetchSettingActiveCode() async {
    try {
      var result = await _authDataSource.getSettingActiveCode();
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, UserResponse>> signUp(
      SignUpSchema signUpSchema) async {
    try {
      var result = await _authDataSource.signUp(signUpSchema);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, CreatePasswordResponse>> createPassword(
      CreatePasswordSchema createPasswordSchema) async {
    try {
      var result = await _authDataSource.createPassword(createPasswordSchema);
      'create success $result'.log;
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, UserInfoEntity>> currentUser() async {
    try {
      final user = await _secureStorage.readCurrentUser();
      if (user == null) {
        return const Left(FailureMessage('msg'));
      } else {
        return Right(user.toEntity());
      }
    } catch (e) {
      'error get current user $e'.log;
      return const Left(FailureMessage('empty user'));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> saveUser(
      UserInfoModel userInfoModel) async {
    try {
      _secureStorage.writeUser(userInfoModel);
      'write user is  success '.log;

      return const Right(true);
    } catch (e) {
      'write user is $e'.log;
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> checkActivationCode(
      String activationCode) async {
    try {
      await _authDataSource.verifyActiveCode(activationCode);
      return const Right(true);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> makeFirstOpenApp() async {
    try {
      await _secureStorage.makeFirstOpen();
      return const Right(true);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }

  @override
  Future<Either<FailureMessage, bool>> isFirstOpenApp() async {
    try {
      var result = await _secureStorage.isFirstOpenApp();
      return Right(result);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
