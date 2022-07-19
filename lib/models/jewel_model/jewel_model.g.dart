// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewel_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JewelModel _$JewelModelFromJson(Map<String, dynamic> json) => JewelModel(
      json['id'] as int,
      json['nftId'] as int,
      json['nftName'] as String,
      json['contractAddress'] as String,
      json['tokenId'] as int,
      json['owner'] as String,
      json['type'] as String,
      json['jewelType'] as String,
      json['image'] as String,
      json['time'] as int,
      json['level'] as int,
      json['bedMint'] as int,
      json['isMint'] as int,
      json['isBurn'] as int,
      json['efficiency'] as String,
      json['durability'] as String,
      json['luck'] as String,
      json['bonus'] as String,
      json['special'] as String,
      json['resilience'] as String,
    )
      ..classNft = json['classNft']
      ..quality = json['quality'];

Map<String, dynamic> _$JewelModelToJson(JewelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nftId': instance.nftId,
      'nftName': instance.nftName,
      'contractAddress': instance.contractAddress,
      'tokenId': instance.tokenId,
      'owner': instance.owner,
      'type': instance.type,
      'jewelType': instance.jewelType,
      'classNft': instance.classNft,
      'quality': instance.quality,
      'image': instance.image,
      'time': instance.time,
      'level': instance.level,
      'bedMint': instance.bedMint,
      'isMint': instance.isMint,
      'isBurn': instance.isBurn,
      'efficiency': instance.efficiency,
      'durability': instance.durability,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
    };
