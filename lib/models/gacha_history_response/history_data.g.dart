// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) => HistoryData(
      id: json['id'] as int?,
      userId: json['userId'] as int?,
      specialTimes: json['specialTimes'] as int?,
      commonTimes: json['commonTimes'] as int?,
      totalCommonTimes: json['totalCommonTimes'] as int?,
      totalSpecialTimes: json['totalSpecialTimes'] as int?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$HistoryDataToJson(HistoryData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'specialTimes': instance.specialTimes,
      'commonTimes': instance.commonTimes,
      'totalCommonTimes': instance.totalCommonTimes,
      'totalSpecialTimes': instance.totalSpecialTimes,
      'createdAt': instance.createdAt,
    };
