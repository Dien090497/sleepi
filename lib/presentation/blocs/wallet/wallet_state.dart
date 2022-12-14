import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';

part 'wallet_state.freezed.dart';

@freezed
class WalletState with _$WalletState {
  const factory WalletState.initial() = WalletStateInitial;

  const factory WalletState.notExisted() = WalletNotExisted;

  const factory WalletState.notOpen() = WalletNotOpen;

  const factory WalletState.loading() = WalletStateLoading;

  const factory WalletState.loaded({
    @Default(false) bool isLoading,
    required WalletInfoEntity walletInfoEntity,
    required List<TokenEntity> tokenList,
  }) = WalletStateLoaded;

  const factory WalletState.error(String message) = WalletStateError;

  const factory WalletState.loadingHistory() = WalletStateLoadingHistory;

  const factory WalletState.getHistorySuccess(List<TransactionIsarModel> list) =
      WalletStateGetHistorySuccess;
}
