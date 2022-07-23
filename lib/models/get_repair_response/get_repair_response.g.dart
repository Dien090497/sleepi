// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_repair_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetRepairResponse _$GetRepairResponseFromJson(Map<String, dynamic> json) =>
    GetRepairResponse(
      data: GetRepairData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetRepairResponseToJson(GetRepairResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

GetRepairData _$GetRepairDataFromJson(Map<String, dynamic> json) =>
    GetRepairData(
      level: json['level'] as int?,
      fee: (json['fee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$GetRepairDataToJson(GetRepairData instance) =>
    <String, dynamic>{
      'level': instance.level,
      'fee': instance.fee,
    };
