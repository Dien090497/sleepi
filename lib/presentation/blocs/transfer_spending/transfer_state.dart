import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/transfer_spending_entity/transfer_spending_entity.dart';

part 'transfer_state.freezed.dart';

@freezed
class TransferState with _$TransferState {
  const factory TransferState.success() = TransferSuccess;

  const factory TransferState.error(String message, {String? typeError}) =
      TransferError;

  const factory TransferState.loaded({
    required bool isToSpending,
    bool? needApprove,
    @Default(false) bool isLoading,
    TransferSpendingEntity? transferSpendingEntity,
  }) = TransferLoaded;
}
