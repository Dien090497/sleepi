// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigInfo _$ConfigInfoFromJson(Map<String, dynamic> json) => ConfigInfo(
      name: json['name'] as String?,
      value: (json['value'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConfigInfoToJson(ConfigInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'value': instance.value,
    };
