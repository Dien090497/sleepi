// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stack_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackDetails _$StackDetailsFromJson(Map<String, dynamic> json) => StackDetails(
      userId: json['userId'] as int,
      stackCampaignId: json['stackCampaignId'] as int,
      isLock: json['isLock'] as int,
      id: json['id'] as int,
      stakeToken: json['stakeToken'] as String,
      amount: json['amount'] as String,
      reward: json['reward'] as String,
      statusStacking: json['statusStacking'] as String,
      startTime: json['startTime'] as String,
      rewardTime: json['rewardTime'] as String,
      lockTime: json['lockTime'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$StackDetailsToJson(StackDetails instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'stackCampaignId': instance.stackCampaignId,
      'isLock': instance.isLock,
      'id': instance.id,
      'stakeToken': instance.stakeToken,
      'amount': instance.amount,
      'reward': instance.reward,
      'statusStacking': instance.statusStacking,
      'startTime': instance.startTime,
      'rewardTime': instance.rewardTime,
      'lockTime': instance.lockTime,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
