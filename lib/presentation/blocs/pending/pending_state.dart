import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/transaction/transaction_entity.dart';

part 'pending_state.freezed.dart';

enum PendingStatus { initial, success, failure, loading }

@freezed
class PendingState with _$PendingState {
  const factory PendingState.loaded(
    PendingStatus status,
    List<TransactionEntity> list,
    bool hasReachedMax,
  ) = PendingStateLoaded;
}
