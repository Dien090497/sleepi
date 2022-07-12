// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_health.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataHealth _$DataHealthFromJson(Map<String, dynamic> json) => DataHealth(
      trackingId: json['trackingId'] as int?,
      dataType: json['dataType'] as String?,
      value: json['value'] as String?,
      platformType: json['platformType'] as String?,
      unit: json['unit'] as String?,
      dateFrom: json['dateFrom'] as String?,
      dateTo: json['dateTo'] as String?,
      sourceName: json['sourceName'] as String?,
      sourceId: json['sourceId'] as String?,
    );

Map<String, dynamic> _$DataHealthToJson(DataHealth instance) =>
    <String, dynamic>{
      'trackingId': instance.trackingId,
      'dataType': instance.dataType,
      'value': instance.value,
      'platformType': instance.platformType,
      'unit': instance.unit,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'sourceName': instance.sourceName,
      'sourceId': instance.sourceId,
    };
