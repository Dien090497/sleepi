// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_user_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyUserSchema _$VerifyUserSchemaFromJson(Map<String, dynamic> json) =>
    VerifyUserSchema(
      signedMessage: json['signedMessage'] as String,
      signer: json['signer'] as String,
    );

Map<String, dynamic> _$VerifyUserSchemaToJson(VerifyUserSchema instance) =>
    <String, dynamic>{
      'signedMessage': instance.signedMessage,
      'signer': instance.signer,
    };
