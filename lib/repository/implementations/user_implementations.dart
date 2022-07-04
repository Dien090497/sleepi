import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/repository/user_repository.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';

@Injectable(as: IUserRepository)
class UserImplementation extends IUserRepository {
  final AuthDataSource _authDataSource;

  UserImplementation(this._authDataSource);

  @override
  Future<Either<FailureMessage, dynamic>> changePassword(
      ChangePasswordSchema changePasswordSchema) async {
    try {
      var result = await _authDataSource.changePassword(changePasswordSchema);
      'change success $result'.log;
      return Right(result);
    } catch (e) {

      return Left(FailureMessage('$e'));
    }
  }
}
