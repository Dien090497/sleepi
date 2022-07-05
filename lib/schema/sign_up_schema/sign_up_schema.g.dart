// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpSchema _$SignUpSchemaFromJson(Map<String, dynamic> json) => SignUpSchema(
      json['otp'] as int,
      json['email'] as String,
    );

Map<String, dynamic> _$SignUpSchemaToJson(SignUpSchema instance) =>
    <String, dynamic>{
      'otp': instance.otp,
      'email': instance.email,
    };
