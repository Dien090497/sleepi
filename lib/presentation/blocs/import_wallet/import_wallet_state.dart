import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';

part 'import_wallet_state.freezed.dart';

@freezed
class ImportWalletState with _$ImportWalletState {
  const factory ImportWalletState.initial({
    @Default(false) bool isLoading,
  }) = ImportWalletInitial;

  const factory ImportWalletState.success(
    WalletInfoEntity entity,
    UserInfoEntity? userInfoEntity,
    List<TokenSpending> listTokens,
  ) = ImportWalletDone;

  const factory ImportWalletState.verifyOtpSuccess() =
      ImportWalletVerifyOtpSuccess;

  const factory ImportWalletState.errorOtp(String msg) = ImportWalletErrorOtp;

  const factory ImportWalletState.errorMnemonic(String msg) =
      ImportWalletErrorMnemonic;
}
