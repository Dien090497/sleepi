// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_result_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingResultModel _$TrackingResultModelFromJson(Map<String, dynamic> json) =>
    TrackingResultModel(
      hashId: json['hashId'] as String?,
      userId: json['userId'] as String?,
      trackingId: json['trackingId'] as int?,
      actualEarn: json['actualEarn'] as String?,
      tokenEarnSymbol: json['tokenEarnSymbol'] as String?,
      nAwk: json['nAwk'] as int?,
      sleepOnsetTime: json['sleepOnsetTime'] as String?,
      sleepDurationTime: json['sleepDurationTime'] as String?,
      wokeUpTime: json['wokeUpTime'] as String?,
      bedTime: json['bedTime'] as String?,
      sleepQuality: json['sleepQuality'] as int?,
      startSleepTime: json['startSleepTime'] as int?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      id: json['id'] as int?,
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
      'sleepQuality': instance.sleepQuality,
      'startSleepTime': instance.startSleepTime,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'id': instance.id,
    };
