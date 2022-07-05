// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_nft_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyNFTSchema _$BuyNFTSchemaFromJson(Map<String, dynamic> json) => BuyNFTSchema(
      json['buyerId'] as int,
      json['sellerId'] as int,
      json['nftId'] as int,
    );

Map<String, dynamic> _$BuyNFTSchemaToJson(BuyNFTSchema instance) =>
    <String, dynamic>{
      'buyerId': instance.buyerId,
      'sellerId': instance.sellerId,
      'nftId': instance.nftId,
    };
