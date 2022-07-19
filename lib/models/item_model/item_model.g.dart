// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) => ItemModel(
      json['id'] as int,
      json['nftId'] as int,
      json['nftName'] as String,
      json['image'] as String,
      json['contractAddress'] as String,
      json['type'] as String,
      json['isMint'] as int,
      json['quality'] as String?,
      json['owner'] as String,
      json['time'] as int,
      json['level'] as int,
      json['bedMint'] as int,
      (json['efficiency'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['tokenId'] as int,
      (json['durability'] as num).toDouble(),
      json['itemType'] as String?,
      json['effect'] as String?,
    )
      ..jewelType = json['jewelType']
      ..classBed = json['classNft'];

Map<String, dynamic> _$ItemModelToJson(ItemModel instance) => <String, dynamic>{
      'id': instance.id,
      'nftId': instance.nftId,
      'nftName': instance.nftName,
      'image': instance.image,
      'contractAddress': instance.contractAddress,
      'type': instance.type,
      'itemType': instance.itemType,
      'jewelType': instance.jewelType,
      'classNft': instance.classBed,
      'isMint': instance.isMint,
      'quality': instance.quality,
      'owner': instance.owner,
      'time': instance.time,
      'level': instance.level,
      'bedMint': instance.bedMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'effect': instance.effect,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'tokenId': instance.tokenId,
      'durability': instance.durability,
    };
