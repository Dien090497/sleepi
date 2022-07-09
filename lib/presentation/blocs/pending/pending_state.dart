import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/withdraw/withdraw_entity.dart';

part 'pending_state.freezed.dart';

enum PendingStatus { initial, success, failure }

@freezed
class PendingState with _$PendingState {
  const factory PendingState.loaded(
    PendingStatus status,
    List<WithdrawEntity> list,
    bool hasReachedMax,
  ) = PendingStateLoaded;
}
