import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';

part 'transfer_state.freezed.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.initial({
    required String address,
    required bool isToSpending,
}) = TransferInitial;

  const factory TransferState.success() = TransferSuccess;

  const factory TransferState.failed(String msg) = TransferFailed;

  const factory TransferState.loaded({
    required TokenEntity currentToken,
    required TokenEntity backupToken,
    required bool isToSpending,
    required List<TokenEntity> spendingTokens,
    required List<TokenEntity> walletTokens,
    required int userId,
    required String ownerAddress,
    @Default(false) bool isLoading,
    double? amount,
    String? fee,
    bool? isAllowance,
    String? errorMsg,
  }) = TransferLoaded;
}
