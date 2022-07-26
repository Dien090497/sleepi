// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalConfigResponse _$GlobalConfigResponseFromJson(
        Map<String, dynamic> json) =>
    GlobalConfigResponse(
      (json['tokenSupport'] as List<dynamic>)
          .map((e) => _Token.fromJson(e as Map<String, dynamic>))
          .toList(),
      _NftAddress.fromJson(json['nftAddress'] as Map<String, dynamic>),
      contract: json['contract'] as String,
      isEnableActiveCode: json['isEnableActiveCode'] as bool,
      messageSign: json['message_sign'] as String,
    );

Map<String, dynamic> _$GlobalConfigResponseToJson(
        GlobalConfigResponse instance) =>
    <String, dynamic>{
      'contract': instance.contract,
      'isEnableActiveCode': instance.isEnableActiveCode,
      'message_sign': instance.messageSign,
      'tokenSupport': instance.tokens.map((e) => e.toJson()).toList(),
      'nftAddress': instance.nftAddress.toJson(),
    };

_Token _$TokenFromJson(Map<String, dynamic> json) => _Token(
      json['symbol'] as String,
      json['address'] as String,
    );

Map<String, dynamic> _$TokenToJson(_Token instance) => <String, dynamic>{
      'symbol': instance.symbol,
      'address': instance.address,
    };

_NftAddress _$NftAddressFromJson(Map<String, dynamic> json) => _NftAddress(
      json['bed'] as String,
      json['bedbox'] as String,
      json['jewel'] as String,
      json['item'] as String,
    );

Map<String, dynamic> _$NftAddressToJson(_NftAddress instance) =>
    <String, dynamic>{
      'bed': instance.bedAddress,
      'bedbox': instance.bedBoxAddress,
      'jewel': instance.jewelAddress,
      'item': instance.itemAddress,
    };
