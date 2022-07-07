// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserSchema _$VerifyUserSchemaFromJson(Map<String, dynamic> json) =>
    VerifyUserSchema(
      message: json['message'] as String,
      signedMessage: json['signedMessage'] as String,
      signer: json['signer'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$VerifyUserSchemaToJson(VerifyUserSchema instance) =>
    <String, dynamic>{
      'message': instance.message,
      'signedMessage': instance.signedMessage,
      'signer': instance.signer,
      'email': instance.email,
    };
