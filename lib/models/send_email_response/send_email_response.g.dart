// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_email_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendEmailResponse _$SendEmailResponseFromJson(Map<String, dynamic> json) =>
    SendEmailResponse(
      Content.fromJson(json['data'] as Map<String, dynamic>),
      json['meta'] as Object,
    );

Map<String, dynamic> _$SendEmailResponseToJson(SendEmailResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
      'meta': instance.meta,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['message'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'message': instance.message,
    };
