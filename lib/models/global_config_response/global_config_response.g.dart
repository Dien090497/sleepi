// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalConfigResponse _$GlobalConfigResponseFromJson(
        Map<String, dynamic> json) =>
    GlobalConfigResponse(
      contract: json['contract'] as String,
      isEnableActiveCode: json['isEnableActiveCode'] as bool,
      messageSign: json['message_sign'] as String,
    );

Map<String, dynamic> _$GlobalConfigResponseToJson(
        GlobalConfigResponse instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'isEnableActiveCode': instance.isEnableActiveCode,
      'message_sign': instance.messageSign,
    };
