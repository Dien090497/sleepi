import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/isar_models/transaction_isar/transaction_isar_model.dart';

part 'history_transaction_state.freezed.dart';

@freezed
class HistoryTransactionState with _$HistoryTransactionState {
  const factory HistoryTransactionState.initial() = HistoryTransactionStateInitial;

  const factory HistoryTransactionState.loading() =HistoryTransactionStateLoading;

  const factory HistoryTransactionState.loaded({
    @Default(false) bool isLoading,
  }) = HistoryTransactionStateLoaded;

  const factory HistoryTransactionState.error(String message) = HistoryTransactionStateError;

  const factory HistoryTransactionState.loadingHistory() = HistoryTransactionStateLoadingHistory;

  const factory HistoryTransactionState.refreshHistory() = HistoryTransactionStateRefreshHistory;

  const factory HistoryTransactionState.getHistorySuccess(List<TransactionIsarModel> list) =
  HistoryTransactionStateSuccess;
}
