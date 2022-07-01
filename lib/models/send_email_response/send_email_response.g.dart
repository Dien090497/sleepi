// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailResponse _$SendEmailResponseFromJson(Map<String, dynamic> json) =>
    SendEmailResponse(
      Data.fromJson(json['data'] as Map<String, dynamic>),
      json['meta'],
    );

Map<String, dynamic> _$SendEmailResponseToJson(SendEmailResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'meta': instance.meta,
    };
