// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingResultModel _$TrackingResultModelFromJson(Map<String, dynamic> json) =>
    TrackingResultModel(
      json['hashId'] as String?,
      json['userId'] as String?,
      json['trackingId'] as int?,
      json['actualEarn'] as String?,
      json['tokenEarnSymbol'] as String?,
      json['nAwk'] as int?,
      json['sleepOnsetTime'] as String?,
      json['sleepDurationTime'] as String?,
      json['wokeUpTime'] as String?,
      json['bedTime'] as String?,
      json['bedNFTHoldingBonus'] as String?,
      json['stakingBonus'] as String?,
      json['basePointEff'] as String?,
      json['insurance'] as String?,
      json['enableInsurance'] as bool,
      json['sleepQuality'] as int?,
      json['startSleepTime'] as int?,
      json['id'] as int?,
    );

Map<String, dynamic> _$TrackingResultModelToJson(
        TrackingResultModel instance) =>
    <String, dynamic>{
      'hashId': instance.hashId,
      'userId': instance.userId,
      'trackingId': instance.trackingId,
      'actualEarn': instance.actualEarn,
      'tokenEarnSymbol': instance.tokenEarnSymbol,
      'nAwk': instance.nAwk,
      'sleepOnsetTime': instance.sleepOnsetTime,
      'sleepDurationTime': instance.sleepDurationTime,
      'wokeUpTime': instance.wokeUpTime,
      'bedTime': instance.bedTime,
      'bedNFTHoldingBonus': instance.bedNFTHoldingBonus,
      'stakingBonus': instance.stakingBonus,
      'basePointEff': instance.basePointEff,
      'insurance': instance.insurance,
      'enableInsurance': instance.enableInsurance,
      'sleepQuality': instance.sleepQuality,
      'startSleepTime': instance.startSleepTime,
      'id': instance.id,
    };
