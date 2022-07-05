import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/auth_repository.dart';
import 'package:slee_fi/schema/verify_schema/verify_schema.dart';
import 'package:slee_fi/usecase/usecase.dart';

class VerifyOTPUseCase extends UseCase<dynamic, VerifyOTPSchema>{
  final IAuthRepository _authImplementation;

  VerifyOTPUseCase(this._authImplementation);
  @override
  Future<Either<FailureMessage, dynamic>> call(params) => _authImplementation.verifyOTP(params);
}
