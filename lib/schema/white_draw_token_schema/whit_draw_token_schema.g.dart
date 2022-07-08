// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whit_draw_token_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhitDrawTokenSchema _$WhitDrawTokenSchemaFromJson(Map<String, dynamic> json) =>
    WhitDrawTokenSchema(
      json['type'] as String,
      json['tokenAddress'] as String,
      json['amount'] as String,
    );

Map<String, dynamic> _$WhitDrawTokenSchemaToJson(
        WhitDrawTokenSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tokenAddress': instance.tokenAddress,
      'amount': instance.amount,
    };
