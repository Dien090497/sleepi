// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_attribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftAttributeModel _$NftAttributeModelFromJson(Map<String, dynamic> json) =>
    NftAttributeModel(
      json['id'] as int,
      json['nftId'] as int,
      json['contractAddress'] as String,
      json['tokenId'] as int,
      json['owner'] as String,
      json['type'] as String,
      json['classNft'] as String,
      json['quality'] as String,
      json['time'] as int,
      json['level'] as int,
      json['bedMint'] as int,
      json['efficiency'] as int,
      json['luck'] as int,
      json['bonus'] as int,
      json['special'] as int,
      json['resilience'] as int,
    );

Map<String, dynamic> _$NftAttributeModelToJson(NftAttributeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nftId': instance.nftId,
      'contractAddress': instance.contractAddress,
      'tokenId': instance.tokenId,
      'owner': instance.owner,
      'type': instance.type,
      'classNft': instance.classNft,
      'quality': instance.quality,
      'time': instance.time,
      'level': instance.level,
      'bedMint': instance.bedMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
    };
