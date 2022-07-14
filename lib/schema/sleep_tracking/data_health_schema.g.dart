// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_health_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHealthSchema _$DataHealthSchemaFromJson(Map<String, dynamic> json) =>
    DataHealthSchema(
      trackingId: json['trackingId'] as int?,
      datas: (json['datas'] as List<dynamic>?)
          ?.map((e) => DataHealth.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DataHealthSchemaToJson(DataHealthSchema instance) =>
    <String, dynamic>{
      'trackingId': instance.trackingId,
      'datas': instance.datas?.map((e) => e.toJson()).toList(),
    };
