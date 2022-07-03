import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/transfer_spending_entity/transfer_spending_entity.dart';

part 'transfer_spending_state.freezed.dart';

@freezed
class TransferSpendingState with _$TransferSpendingState {
  const factory TransferSpendingState.initial() = TransferSpendingStateInitial;

  const factory TransferSpendingState.loading() = TransferSpendingStateLoading;

  const factory TransferSpendingState.error({required String message, String? typeError}) = TransferSpendingStateError;

  const factory TransferSpendingState.loaded({
    double? fee,
    TransferSpendingEntity? transferSpendingEntity,
}) = TransferSpendingStateLoaded;

}
