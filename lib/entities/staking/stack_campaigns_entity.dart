import 'package:freezed_annotation/freezed_annotation.dart';

part 'stack_campaigns_entity.freezed.dart';

@freezed
class StackCampaignsEntity with _$StackCampaignsEntity {
  const factory StackCampaignsEntity({
    required String stakeToken,
    required String rewardToken,
    required String createdAt,
    required String updatedAt,
    required int id,
  }) = _StackCampaignsEntity;
}
