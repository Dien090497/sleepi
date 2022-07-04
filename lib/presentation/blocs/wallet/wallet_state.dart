import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = WalletStateInitial;

  const factory WalletState.loading() = WalletStateLoading;

  const factory WalletState.loaded({
    required WalletInfoEntity? walletInfoEntity,
    required bool firstOpenWallet,
    required List<TokenEntity> tokenList,
  }) = WalletStateLoaded;

  const factory WalletState.empty() = WalletStateEmpty;

  const factory WalletState.error({required String message}) = WalletStateError;
}
