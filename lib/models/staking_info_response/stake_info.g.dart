// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stake_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StakeInfo _$StakeInfoFromJson(Map<String, dynamic> json) => StakeInfo(
      userId: json['user_id'] as int?,
      totalStake: json['total_stake'] as String?,
      totalReward: json['total_reward'] as String?,
      mintingDiscount: json['minting_discount'] as String?,
      levelUpDiscount: json['level_up_discount'] as String?,
      earningToken: json['earning_token'] as String?,
      symbol: json['symbol'] as String?,
    );

Map<String, dynamic> _$StakeInfoToJson(StakeInfo instance) => <String, dynamic>{
      'user_id': instance.userId,
      'total_stake': instance.totalStake,
      'total_reward': instance.totalReward,
      'minting_discount': instance.mintingDiscount,
      'level_up_discount': instance.levelUpDiscount,
      'earning_token': instance.earningToken,
      'symbol': instance.symbol,
    };
