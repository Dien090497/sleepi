// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_attribute_minting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftAttributeMinting _$NftAttributeMintingFromJson(Map<String, dynamic> json) =>
    NftAttributeMinting(
      parent1: json['parent1'] as int,
      parent2: json['parent2'] as int,
      id: json['id'] as int,
      durability: json['durability'] as int,
      name: json['name'] as String,
      image: json['image'] as String,
      nftType: json['nftType'] as String,
      nftId: json['nftId'] as int,
      type: json['type'] as String,
      nftName: json['nftName'] as String,
      efficiency: json['efficiency'] as int,
      jewelCorrection: json['jewelCorrection'] as String?,
      jewelType: json['jewelType'] as String,
      classNft: json['classNft'] as String,
      quality: json['quality'] as String,
      itemType: json['itemType'] as String,
      bonus: json['bonus'] as int,
      tokenId: json['tokenId'] as int,
      bedMint: json['bedMint'] as int,
      luck: json['luck'] as int,
      resilience: json['resilience'] as int,
      special: json['special'] as int,
      contractAddress: json['contractAddress'] as String,
      isMint: json['isMint'] as int,
      level: json['level'] as int,
      owner: json['owner'] as String,
      time: json['time'] as int,
    );

Map<String, dynamic> _$NftAttributeMintingToJson(
        NftAttributeMinting instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parent1': instance.parent1,
      'parent2': instance.parent2,
      'durability': instance.durability,
      'isMint': instance.isMint,
      'nftId': instance.nftId,
      'tokenId': instance.tokenId,
      'level': instance.level,
      'time': instance.time,
      'bedMint': instance.bedMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'nftName': instance.nftName,
      'type': instance.type,
      'jewelType': instance.jewelType,
      'owner': instance.owner,
      'itemType': instance.itemType,
      'contractAddress': instance.contractAddress,
      'quality': instance.quality,
      'classNft': instance.classNft,
      'image': instance.image,
      'nftType': instance.nftType,
      'jewelCorrection': instance.jewelCorrection,
      'name': instance.name,
    };
