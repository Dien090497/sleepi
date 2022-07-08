import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/staking/stack_campaigns_entity.dart';

part 'stack_campaigns.g.dart';

@JsonSerializable()
class StackCampaigns {
  final String stakeToken;
  final String rewardToken;
  final String createdAt;
  final String updatedAt;
  final int id;

  StackCampaigns({
    required this.stakeToken,
    required this.rewardToken,
    required this.createdAt,
    required this.updatedAt,
    required this.id,
  });

factory StackCampaigns.fromJson(Map<String, dynamic> json) =>
      _$StackCampaignsFromJson(json);

  Map<String, dynamic> toJson() => _$StackCampaignsToJson(this);

  StackCampaignsEntity toEntity() => StackCampaignsEntity(
    createdAt: createdAt,
    updatedAt: updatedAt,
    id: id,
    rewardToken: rewardToken,
    stakeToken: stakeToken,
  );
}
