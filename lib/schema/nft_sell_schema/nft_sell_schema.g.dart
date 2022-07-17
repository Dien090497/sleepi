// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_sell_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NFTSellSchema _$NFTSellSchemaFromJson(Map<String, dynamic> json) =>
    NFTSellSchema(
      nftId: json['nftId'] as int,
      amount: json['amount'] as String,
    );

Map<String, dynamic> _$NFTSellSchemaToJson(NFTSellSchema instance) =>
    <String, dynamic>{
      'nftId': instance.nftId,
      'amount': instance.amount,
    };
