import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transfer_state.freezed.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.failed(String msg) = TransferFailed;

  const factory TransferState.getEstimateGasFee(double depositTokenGas) = TransferEstimateGasFeeSuccess;

  const factory TransferState.success() = TransferSuccess;

  const factory TransferState.loaded({
    required bool isToSpending,
    @Default(false) bool isLoading,
    String? errorMsg,
    String? typeError,
    bool? needApprove,
  }) = TransferLoaded;
}
