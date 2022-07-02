// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInResponse _$SignInResponseFromJson(Map<String, dynamic> json) =>
    SignInResponse(
      Content.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInResponseToJson(SignInResponse instance) =>
    <String, dynamic>{
      'data': instance.data.toJson(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['accessToken'] as String,
      json['refreshToken'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
