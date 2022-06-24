import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = WalletStateInitial;

  const factory WalletState.loading() = WalletStateLoading;
  const factory WalletState.empty() = WalletStateEmpty;

  const factory WalletState.success({required WalletInfoEntity walletInfoEntity, required List<TokenEntity> tokenList}) =
      WalletStateSuccess;

  const factory WalletState.error({required String message}) = WalletStateError;
}
