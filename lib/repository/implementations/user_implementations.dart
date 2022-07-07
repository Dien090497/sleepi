import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/datasources/remote/auth_datasource/auth_datasource.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
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
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<ActiveCodeEntity>>>
      fetchActivationCodes() async {
    try {
      var result = await _authDataSource.fetchActivationCodes();
      return Right(result.data.map((e) => e.toEntity()).toList());
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }

  @override
  Future<Either<FailureMessage, List<TokenSpending>>> fetchBalanceSpending(
      String userID) async {
    try {
      var result = await _authDataSource.fetchBalanceSpending(userID);
      return Right(result);
    } on Exception catch (e) {
      return Left(FailureMessage.fromException(e));
    }
  }
}
