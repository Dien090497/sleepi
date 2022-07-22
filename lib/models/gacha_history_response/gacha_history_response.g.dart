// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaHistoryResponse _$GachaHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    GachaHistoryResponse(
      status: json['status'] as String?,
      data: json['data'] == null
          ? null
          : HistoryData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GachaHistoryResponseToJson(
        GachaHistoryResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data?.toJson(),
    };
