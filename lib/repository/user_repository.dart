import 'package:dartz/dartz.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';

abstract class IUserRepository {
  Future<Either<FailureMessage, dynamic>> changePassword(ChangePasswordSchema changePasswordSchema);
}
