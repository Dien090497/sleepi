// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'staking_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StakingInfoResponse _$StakingInfoResponseFromJson(Map<String, dynamic> json) =>
    StakingInfoResponse(
      tvl: json['tvl'] as String,
      apr: json['apr'] as String,
      slftPriceUsd: (json['slftPriceUsd'] as num).toDouble(),
      aprInDay: json['aprInDay'] as String,
      isCompound: json['isCompound'] as bool,
      stake: StakeInfo.fromJson(json['stake'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StakingInfoResponseToJson(
        StakingInfoResponse instance) =>
    <String, dynamic>{
      'tvl': instance.tvl,
      'apr': instance.apr,
      'aprInDay': instance.aprInDay,
      'slftPriceUsd': instance.slftPriceUsd,
      'isCompound': instance.isCompound,
      'stake': instance.stake.toJson(),
    };
