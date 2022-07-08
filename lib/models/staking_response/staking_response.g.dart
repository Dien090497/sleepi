// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StakingResponse _$StakingResponseFromJson(Map<String, dynamic> json) =>
    StakingResponse(
      stackCampaigns: StackCampaigns.fromJson(
          json['stackCampaigns'] as Map<String, dynamic>),
      stackDetails:
          StackDetails.fromJson(json['stackDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StakingResponseToJson(StakingResponse instance) =>
    <String, dynamic>{
      'stackCampaigns': instance.stackCampaigns.toJson(),
      'stackDetails': instance.stackDetails.toJson(),
    };
