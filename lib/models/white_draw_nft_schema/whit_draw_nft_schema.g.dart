// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'whit_draw_nft_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WhitDrawNFTSchema _$WhitDrawNFTSchemaFromJson(Map<String, dynamic> json) =>
    WhitDrawNFTSchema(
      json['type'] as String,
      json['symbol'] as String,
      json['amount'] as String,
      json['mainWallet'] as String,
    );

Map<String, dynamic> _$WhitDrawNFTSchemaToJson(WhitDrawNFTSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'symbol': instance.symbol,
      'amount': instance.amount,
      'mainWallet': instance.mainWallet,
    };
