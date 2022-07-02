// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpSchema _$SignUpSchemaFromJson(Map<String, dynamic> json) => SignUpSchema(
      json['name'] as String,
      json['username'] as String,
      json['password'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$SignUpSchemaToJson(SignUpSchema instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
    };
