// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_active_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingActiveCodeResponse _$SettingActiveCodeResponseFromJson(
        Map<String, dynamic> json) =>
    SettingActiveCodeResponse(
      Content.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingActiveCodeResponseToJson(
        SettingActiveCodeResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['isEnable'] as bool,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'isEnable': instance.isEnable,
    };
