import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';

abstract class IUserRepository {
  Future<Either<FailureMessage, dynamic>> changePassword(ChangePasswordSchema changePasswordSchema);

  Future<Either<FailureMessage, List<ActiveCodeEntity>>> fetchActivationCodes();

  Future<Either<FailureMessage, List<TokenSpending>>> fetchBalanceSpending(String userID);


}
