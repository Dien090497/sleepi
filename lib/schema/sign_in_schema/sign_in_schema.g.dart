// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInSchema _$SignInSchemaFromJson(Map<String, dynamic> json) => SignInSchema(
      json['email'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$SignInSchemaToJson(SignInSchema instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
