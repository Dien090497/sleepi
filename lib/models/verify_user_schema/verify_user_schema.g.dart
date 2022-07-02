// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserSchema _$VerifyUserSchemaFromJson(Map<String, dynamic> json) =>
    VerifyUserSchema(
      json['message'] as String,
      json['signedMessage'] as String,
      json['signer'] as String,
      json['email'] as String,
    );

Map<String, dynamic> _$VerifyUserSchemaToJson(VerifyUserSchema instance) =>
    <String, dynamic>{
      'message': instance.message,
      'signedMessage': instance.signedMessage,
      'signer': instance.signer,
      'email': instance.email,
    };
