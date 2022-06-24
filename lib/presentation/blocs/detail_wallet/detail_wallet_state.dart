import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';

part 'detail_wallet_state.freezed.dart';

@freezed
class DetailWalletState with _$DetailWalletState {
  const factory DetailWalletState.initial() = DetailWalletStateInitial;

  const factory DetailWalletState.loading() = DetailWalletStateLoading;
  const factory DetailWalletState.empty() = DetailWalletStateEmpty;

  const factory DetailWalletState.success({required WalletInfoEntity walletInfoEntity, required List<TokenEntity> tokenList}) =
  DetailWalletStateSuccess;

  const factory DetailWalletState.error({required String message}) = DetailWalletStateError;
}
