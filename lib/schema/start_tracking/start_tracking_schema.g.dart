// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_tracking_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartTrackingSchema _$StartTrackingSchemaFromJson(Map<String, dynamic> json) =>
    StartTrackingSchema(
      isEnableInsurance: json['isEnableInsurance'] as bool,
      alrm: json['alrm'] as bool,
      wakeUp: json['wakeUp'] as String,
      itemUsed: json['itemUsed'] as int,
      bedUsed: json['bedUsed'] as int,
    );

Map<String, dynamic> _$StartTrackingSchemaToJson(
        StartTrackingSchema instance) =>
    <String, dynamic>{
      'isEnableInsurance': instance.isEnableInsurance,
      'alrm': instance.alrm,
      'wakeUp': instance.wakeUp,
      'itemUsed': instance.itemUsed,
      'bedUsed': instance.bedUsed,
    };
