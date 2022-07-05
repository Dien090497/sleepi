// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whit_draw_token_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhitDrawTokenSchema _$WhitDrawTokenSchemaFromJson(Map<String, dynamic> json) =>
    WhitDrawTokenSchema(
      json['type'] as String,
      json['symbol'] as String,
      json['amount'] as String,
      json['mainWallet'] as String,
    );

Map<String, dynamic> _$WhitDrawTokenSchemaToJson(
        WhitDrawTokenSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'symbol': instance.symbol,
      'amount': instance.amount,
      'mainWallet': instance.mainWallet,
    };
