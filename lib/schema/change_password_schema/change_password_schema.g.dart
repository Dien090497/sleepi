// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_password_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChangePasswordSchema _$ChangePasswordSchemaFromJson(
        Map<String, dynamic> json) =>
    ChangePasswordSchema(
      json['email'] as String,
      json['otp'] as int,
      json['newPassword'] as String,
      json['confirmPassword'] as String,
    );

Map<String, dynamic> _$ChangePasswordSchemaToJson(
        ChangePasswordSchema instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
      'newPassword': instance.newPassword,
      'confirmPassword': instance.confirmPassword,
    };
