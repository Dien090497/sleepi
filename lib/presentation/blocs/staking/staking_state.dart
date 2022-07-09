import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';

part 'staking_state.freezed.dart';

@freezed
class StakingState with _$StakingState {
  const factory StakingState.initial() = StakingStateInitial;

  const factory StakingState.loading() = StakingStateLoading;

  const factory StakingState.loaded() = StakingStateLoaded;

  const factory StakingState.empty() = StakingStateEmpty;

  const factory StakingState.stakingSuccess() = StakingStateStakingSuccess;

  const factory StakingState.stakingInfoSuccess(StakingInfoResponse stakingInfoResponse) = StakingStateStakingInfoSuccess;

  const factory StakingState.unStakingSuccess() = StakingStateUnStakingSuccess;

  const factory StakingState.compoundSuccess() = StakingStateCompoundSuccess;

  const factory StakingState.error({required String message}) = StakingStateError;
}
