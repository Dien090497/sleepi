import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'global_wallet_state.freezed.dart';

@freezed
class GlobalWalletState with _$GlobalWalletState {
  const factory GlobalWalletState.initial() = GlobalWalletStateInitial;

  const factory GlobalWalletState.loading() = GlobalWalletStateLoading;

  const factory GlobalWalletState.empty() = GlobalWalletStateEmpty;

  const factory GlobalWalletState.loaded(
      {required WalletInfoEntity? walletInfoEntity,
      required List<TokenEntity> tokenList}) = GlobalWalletStateLoaded;
}
