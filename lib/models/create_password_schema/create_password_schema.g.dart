// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_password_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePasscodeSchema _$CreatePasscodeSchemaFromJson(
        Map<String, dynamic> json) =>
    CreatePasscodeSchema(
      json['email'] as String,
      json['password'] as String,
      json['activeCode'] as String,
      json['otp'] as int,
    );

Map<String, dynamic> _$CreatePasscodeSchemaToJson(
        CreatePasscodeSchema instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'activeCode': instance.activeCode,
      'otp': instance.otp,
    };
