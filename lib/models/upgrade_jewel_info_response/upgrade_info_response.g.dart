// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_info_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeInfoResponse _$UpgradeInfoResponseFromJson(Map<String, dynamic> json) =>
    UpgradeInfoResponse(
      json['level'] as int,
      json['slft'] as int,
      json['slgt'] as int?,
      json['percent'] as int,
    );

Map<String, dynamic> _$UpgradeInfoResponseToJson(
        UpgradeInfoResponse instance) =>
    <String, dynamic>{
      'level': instance.level,
      'slft': instance.slft,
      'slgt': instance.slgt,
      'percent': instance.percent,
    };
