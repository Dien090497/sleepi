// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_password_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePasswordResponse _$CreatePasswordResponseFromJson(
        Map<String, dynamic> json) =>
    CreatePasswordResponse(
      json['meta'],
      Content.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreatePasswordResponseToJson(
        CreatePasswordResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data.toJson(),
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['email'] as String,
      json['wallet'],
      (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'email': instance.email,
      'wallet': instance.wallet,
      'roles': instance.roles,
    };
