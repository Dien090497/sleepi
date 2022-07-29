import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/token/token_entity.dart';

part 'transfer_state.freezed.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.failed(String msg) = TransferFailed;

  const factory TransferState.getEstimateGasFee(double depositTokenGas) = TransferEstimateGasFeeSuccess;

  const factory TransferState.success() = TransferSuccess;

  const factory TransferState.loaded({
    required TokenEntity currentToken,
    required TokenEntity backupToken,
    required bool isToSpending,
    @Default(false) bool isLoading,
    double? amount,
    String? fee,
    bool? isAllowance,
    String? errorMsg,
    String? typeError,
  }) = TransferLoaded;
}
