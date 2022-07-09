import 'package:dartz/dartz.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/models/swap_token_to_wallet_response/swap_token_to_wallet_response.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';
import 'package:slee_fi/models/global_config_response/global_config_response.dart';
import 'package:slee_fi/models/withdraw_history_response/withdraw_history_response.dart';
import 'package:slee_fi/schema/change_password_schema/change_password_schema.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/withdraw_history_usecase.dart';

abstract class IUserRepository {
  Future<Either<FailureMessage, dynamic>> changePassword(
      ChangePasswordSchema changePasswordSchema);

  Future<Either<FailureMessage, List<ActiveCodeEntity>>> fetchActivationCodes();

  Future<Either<FailureMessage, List<TokenSpending>>> fetchBalanceSpending(
      String userID);

  Future<Either<FailureMessage, SwapTokenToWalletResponse>>
      transferTokenToMainWallet(WhitDrawTokenSchema whitDrawTokenSchema);

  Future<Either<FailureMessage, GlobalConfigResponse>> getGlobalConfig();

  Future<Either<FailureMessage, WithdrawHistoryResponse>> withdrawHistory(WithdrawParam withdrawParam);
}
