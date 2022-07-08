import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/staking/staking_entity.dart';
import 'package:slee_fi/models/staking_response/stack_campaigns.dart';
import 'package:slee_fi/models/staking_response/stack_details.dart';

part 'staking_response.g.dart';

@JsonSerializable()
class StakingResponse {
  final StackCampaigns stackCampaigns;
  final StackDetails stackDetails;

  StakingResponse({required this.stackCampaigns, required this.stackDetails});

  factory StakingResponse.fromJson(Map<String, dynamic> json) =>
      _$StakingResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StakingResponseToJson(this);

  StakingEntity toEntity() => StakingEntity(
        stackDetailsEntity: stackDetails.toEntity(),
        stackCampaignsEntity: stackCampaigns.toEntity(),
      );
}
