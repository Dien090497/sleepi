import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/local/secure_storage.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';

@Injectable(as: IAuthRepository)
class AuthImplementation extends IAuthRepository {
  final SecureStorage _secureStorage;

  AuthImplementation(this._secureStorage);

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
  Future<Either<Failure, bool>> checkPassCode(String passcode) async {
    try {
      String? pass = await _secureStorage.readPassCode();
      if(pass == null){
        await _secureStorage.writePassCode(passcode);
        return const Right(true);
      }
      log('passcode: $pass');
      return Right(passcode == pass);
    } catch (e) {
      return Left(FailureMessage('$e'));
    }
  }
}
