import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/staking/stack_campaigns_entity.dart';
import 'package:slee_fi/entities/staking/stack_details_entity.dart';

part 'staking_entity.freezed.dart';

@freezed
class StakingEntity with _$StakingEntity {
  const factory StakingEntity({
    required StackCampaignsEntity stackCampaignsEntity,
    required StackDetailsEntity stackDetailsEntity,
  }) = _StakingEntity;
}
