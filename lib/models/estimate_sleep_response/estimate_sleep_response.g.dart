// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_sleep_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateSleepResponse _$EstimateSleepResponseFromJson(
        Map<String, dynamic> json) =>
    EstimateSleepResponse(
      TotalStats.fromJson(json['totalStats'] as Map<String, dynamic>),
      json['slftTokenAmount'] as String,
      json['stakingAmountTimes'] as String,
      json['insuranceTimes'] as String,
      json['sleepScore'] as int,
      json['positiveEffect'] as String,
      json['estimateSlftEarn'] as String,
      json['durabilityReduce'] as String,
    );

Map<String, dynamic> _$EstimateSleepResponseToJson(
        EstimateSleepResponse instance) =>
    <String, dynamic>{
      'totalStats': instance.totalStats.toJson(),
      'slftTokenAmount': instance.slftTokenAmount,
      'stakingAmountTimes': instance.stakingAmountTimes,
      'insuranceTimes': instance.insuranceTimes,
      'sleepScore': instance.sleepScore,
      'positiveEffect': instance.positiveEffect,
      'estimateSlftEarn': instance.estimateSlftEarn,
      'durabilityReduce': instance.durabilityReduce,
    };

TotalStats _$TotalStatsFromJson(Map<String, dynamic> json) => TotalStats(
      json['efficiency'] as String,
      json['luck'] as String,
      json['resilience'] as String,
      json['bonus'] as String,
      json['special'] as String,
    );

Map<String, dynamic> _$TotalStatsToJson(TotalStats instance) =>
    <String, dynamic>{
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'resilience': instance.resilience,
      'bonus': instance.bonus,
      'special': instance.special,
    };
