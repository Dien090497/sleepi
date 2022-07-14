// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wake_up_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WakeUpSchema _$WakeUpSchemaFromJson(Map<String, dynamic> json) => WakeUpSchema(
      bedTime: json['bedTime'] as String,
      sleepOnsetTime: json['sleepOnsetTime'] as String,
      wokeUp: json['wokeUp'] as String,
      startSleepTime: json['startSleepTime'] as String,
      nocAwake: json['nocAwake'] as String,
      sleepDuration: json['sleepDuration'] as String,
    );

Map<String, dynamic> _$WakeUpSchemaToJson(WakeUpSchema instance) =>
    <String, dynamic>{
      'bedTime': instance.bedTime,
      'sleepOnsetTime': instance.sleepOnsetTime,
      'wokeUp': instance.wokeUp,
      'startSleepTime': instance.startSleepTime,
      'nocAwake': instance.nocAwake,
      'sleepDuration': instance.sleepDuration,
    };
