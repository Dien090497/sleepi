// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_level_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftLevelUp _$NftLevelUpFromJson(Map<String, dynamic> json) => NftLevelUp(
      cost: (json['cost'] as num?)?.toDouble(),
      costSpeedUp: (json['costSpeedUp'] as num?)?.toDouble(),
      requireTime: json['require_time'] as int?,
      sleepTime: json['sleep_time'] as int?,
    );

Map<String, dynamic> _$NftLevelUpToJson(NftLevelUp instance) =>
    <String, dynamic>{
      'cost': instance.cost,
      'costSpeedUp': instance.costSpeedUp,
      'require_time': instance.requireTime,
      'sleep_time': instance.sleepTime,
    };
