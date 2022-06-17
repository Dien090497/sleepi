import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = WalletStateInitial;

  const factory WalletState.loaded({
    required String walletIndex,
    required String networkName,
    required String coin,
  }) = WalletStateLoaded;
}
