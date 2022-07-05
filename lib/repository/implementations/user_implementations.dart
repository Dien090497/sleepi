import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';

@Injectable(as: IUserRepository)
class UserImplementation extends IUserRepository {
  final AuthDataSource _authDataSource;

  UserImplementation(this._authDataSource);

  @override
  Future<Either<FailureMessage, Object>> changePassword(
      ChangePasswordSchema changePasswordSchema) async {
    try {
      var result = await _authDataSource.changePassword(changePasswordSchema);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, Object>> fetchActivationCodes() {
    // TODO: implement fetchActivationCodes
    throw UnimplementedError();
  }
}