// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_sell_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftSell _$NftSellFromJson(Map<String, dynamic> json) => NftSell(
      nftId: json['nftId'] as int?,
      id: json['id'] as int?,
      price: json['price'] as String?,
      status: json['status'] as String?,
      symbol: json['symbol'] as String?,
      transactionsFee: json['transactionsFee'] as String?,
    );

Map<String, dynamic> _$NftSellToJson(NftSell instance) => <String, dynamic>{
      'nftId': instance.nftId,
      'id': instance.id,
      'price': instance.price,
      'status': instance.status,
      'symbol': instance.symbol,
      'transactionsFee': instance.transactionsFee,
    };
