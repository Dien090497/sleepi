import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';

part 'global_wallet_state.freezed.dart';

@freezed
class GlobalWalletState with _$GlobalWalletState {
  const factory GlobalWalletState.initial() = GlobalWalletStateInitial;

  const factory GlobalWalletState.loading() = GlobalWalletStateLoading;

  const factory GlobalWalletState.empty() = GlobalWalletStateEmpty;

  const factory GlobalWalletState.loaded(
      {required List<TokenEntity> tokenList, required bool loading}) = GlobalWalletStateLoaded;
}
