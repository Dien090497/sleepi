import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/models/token_spending/token_spending.dart';

part 'create_wallet_state.freezed.dart';

@freezed
class CreateWalletState with _$CreateWalletState {
  const factory CreateWalletState.initial(
    String passCode, {
    required String mnemonic,
    @Default(false) bool isLoading,
  }) = createWalletStateInitial;

  const factory CreateWalletState.done(
    WalletInfoEntity entity,
    UserInfoEntity? userInfoEntity,
    List<TokenSpending> listTokens,
  ) = createWalletDone;

  const factory CreateWalletState.error(String msg) = createWalletError;
}
