// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_attributes_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaAttributesItem _$GachaAttributesItemFromJson(Map<String, dynamic> json) =>
    GachaAttributesItem(
      image: json['image'] as String,
      name: json['name'] as String,
      nftName: json['nftName'] as String,
      contractAddress: json['contractAddress'] as String,
      owner: json['owner'] as String,
      type: json['type'] as String,
      nftType: json['nftType'] as String,
      itemType: json['itemType'] as String?,
      jewelType: json['jewelType'] as String?,
      classNft: json['classNft'] as String,
      quality: json['quality'] as String,
      level: (json['level'] as num).toDouble(),
      efficiency: (json['efficiency'] as num).toDouble(),
      luck: (json['luck'] as num).toDouble(),
      bonus: (json['bonus'] as num).toDouble(),
      nftId: json['nftId'] as int,
      id: (json['id'] as num).toDouble(),
      bedMint: (json['bedMint'] as num).toDouble(),
      time: (json['time'] as num).toDouble(),
      tokenId: (json['tokenId'] as num).toDouble(),
      special: (json['special'] as num).toDouble(),
      resilience: (json['resilience'] as num).toDouble(),
      frameColor: json['frame_colour'] as String,
    );

Map<String, dynamic> _$GachaAttributesItemToJson(
        GachaAttributesItem instance) =>
    <String, dynamic>{
      'nftId': instance.nftId,
      'time': instance.time,
      'level': instance.level,
      'bedMint': instance.bedMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'tokenId': instance.tokenId,
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'nftName': instance.nftName,
      'contractAddress': instance.contractAddress,
      'owner': instance.owner,
      'type': instance.type,
      'nftType': instance.nftType,
      'itemType': instance.itemType,
      'jewelType': instance.jewelType,
      'classNft': instance.classNft,
      'quality': instance.quality,
      'frame_colour': instance.frameColor,
    };
