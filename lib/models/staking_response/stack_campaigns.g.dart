// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_campaigns.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackCampaigns _$StackCampaignsFromJson(Map<String, dynamic> json) =>
    StackCampaigns(
      stakeToken: json['stakeToken'] as String,
      rewardToken: json['rewardToken'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: json['id'] as int,
    );

Map<String, dynamic> _$StackCampaignsToJson(StackCampaigns instance) =>
    <String, dynamic>{
      'stakeToken': instance.stakeToken,
      'rewardToken': instance.rewardToken,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };
