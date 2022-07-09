// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stake_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StakeInfo _$StakeInfoFromJson(Map<String, dynamic> json) => StakeInfo(
      id: json['id'] as int,
      userId: json['userId'] as int,
      totalStake: json['totalStake'] as String,
      totalReward: json['totalReward'] as String,
      mintingDiscount: json['mintingDiscount'] as String,
      levelUpDiscount: json['levelUpDiscount'] as String,
      earningToken: json['earningToken'] as String,
      symbol: json['symbol'] as String?,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
    );

Map<String, dynamic> _$StakeInfoToJson(StakeInfo instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'totalStake': instance.totalStake,
      'totalReward': instance.totalReward,
      'mintingDiscount': instance.mintingDiscount,
      'levelUpDiscount': instance.levelUpDiscount,
      'earningToken': instance.earningToken,
      'symbol': instance.symbol,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
