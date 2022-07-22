// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_attribute_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftAttributeModel _$NftAttributeModelFromJson(Map<String, dynamic> json) =>
    NftAttributeModel(
      json['nftId'] as int?,
      json['contractAddress'] as String,
      json['owner'] as String?,
      json['type'] as String?,
      json['classNft'] as String?,
      json['quality'] as String?,
      json['time'] as int?,
      json['level'] as int?,
      json['bedMint'] as int?,
      (json['efficiency'] as num?)?.toDouble(),
      (json['durability'] as num?)?.toDouble(),
      (json['luck'] as num?)?.toDouble(),
      (json['bonus'] as num?)?.toDouble(),
      (json['special'] as num?)?.toDouble(),
      (json['resilience'] as num?)?.toDouble(),
      json['tokenId'] as int?,
      json['isMint'] as int?,
      json['image'] as String?,
      json['id'] as int?,
      json['nftName'] as String?,
      json['nftType'] as String?,
      json['jewelType'] as String?,
      json['itemType'] as String?,
      json['levelUpTime'] as String?,
      json['isBurn'] as int?,
      json['createdAt'] as String?,
      json['updatedAt'] as String?,
    );

Map<String, dynamic> _$NftAttributeModelToJson(NftAttributeModel instance) =>
    <String, dynamic>{
      'nftId': instance.nftId,
      'tokenId': instance.tokenId,
      'contractAddress': instance.contractAddress,
      'owner': instance.owner,
      'type': instance.type,
      'classNft': instance.classNft,
      'quality': instance.quality,
      'image': instance.image,
      'time': instance.time,
      'level': instance.level,
      'bedMint': instance.bedMint,
      'isMint': instance.isMint,
      'efficiency': instance.efficiency,
      'durability': instance.durability,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'id': instance.id,
      'nftName': instance.nftName,
      'nftType': instance.nftType,
      'jewelType': instance.jewelType,
      'itemType': instance.itemType,
      'levelUpTime': instance.levelUpTime,
      'isBurn': instance.isBurn,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
