// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whit_draw_token_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhitDrawTokenSchema _$WhitDrawTokenSchemaFromJson(Map<String, dynamic> json) =>
    WhitDrawTokenSchema(
      type: json['type'] as String,
      tokenAddress: json['tokenAddress'] as String,
      amount: json['amount'] as String,
      signedMessage: json['signedMessage'] as String?,
      signer: json['signer'] as String?,
    );

Map<String, dynamic> _$WhitDrawTokenSchemaToJson(
        WhitDrawTokenSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tokenAddress': instance.tokenAddress,
      'amount': instance.amount,
      'signedMessage': instance.signedMessage,
      'signer': instance.signer,
    };
