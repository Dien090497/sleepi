// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingModel _$TrackingModelFromJson(Map<String, dynamic> json) =>
    TrackingModel(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      bedType: json['bedType'] as String?,
      alrm: json['alrm'] as bool?,
      startSleep: json['startSleep'] as int?,
      wakeUp: json['wakeUp'] as int?,
      hashId: json['hashId'] as String?,
      bedUsed: json['bedUsed'] as int?,
      itemUsed: json['itemUsed'] as int?,
      timeSleep: json['timeSleep'],
      efficiency: json['efficiency'] as int?,
      luck: json['luck'] as int?,
      bonus: json['bonus'] as int?,
      special: json['special'] as int?,
      resilience: json['resilience'] as int?,
      itemLevel: json['itemLevel'],
      bedLevel: json['bedLevel'] as int?,
      enableInsurance: json['enableInsurance'] as bool?,
      insurance: json['insurance'] as String?,
      year: json['year'] as int?,
      estEarn: json['estEarn'] as String?,
      actualEarn: json['actualEarn'],
      timeRange: json['timeRange'],
      month: json['month'] as int?,
      quality: json['quality'],
      day: json['day'] as int?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      bedImage: json['bedImage'] as String?,
    );

Map<String, dynamic> _$TrackingModelToJson(TrackingModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'bedType': instance.bedType,
      'alrm': instance.alrm,
      'startSleep': instance.startSleep,
      'wakeUp': instance.wakeUp,
      'hashId': instance.hashId,
      'bedUsed': instance.bedUsed,
      'itemUsed': instance.itemUsed,
      'timeSleep': instance.timeSleep,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'itemLevel': instance.itemLevel,
      'bedLevel': instance.bedLevel,
      'enableInsurance': instance.enableInsurance,
      'insurance': instance.insurance,
      'year': instance.year,
      'estEarn': instance.estEarn,
      'actualEarn': instance.actualEarn,
      'timeRange': instance.timeRange,
      'month': instance.month,
      'quality': instance.quality,
      'day': instance.day,
      'status': instance.status,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'bedImage': instance.bedImage,
    };
