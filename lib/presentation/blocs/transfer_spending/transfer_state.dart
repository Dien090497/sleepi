import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';

part 'transfer_state.freezed.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.success() = TransferSuccess;

  const factory TransferState.loaded({
    required TokenEntity currentToken,
    required TokenEntity backupToken,
    required bool isToSpending,
    @Default(false) bool isLoading,
    double? amount,
    double? fee,
    bool? isAllowance,
    String? errorMsg,
    String? typeError,
  }) = TransferLoaded;
}
