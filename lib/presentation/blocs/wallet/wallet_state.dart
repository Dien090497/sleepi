import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = WalletStateInitial;

  const factory WalletState.loading() = WalletStateLoading;

  const factory WalletState.loaded({required WalletInfoEntity? walletInfoEntity, required bool firstOpenWallet}) =
      WalletStateLoaded;

}
