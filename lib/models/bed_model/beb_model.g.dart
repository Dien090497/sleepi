// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beb_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BedModel _$BedModelFromJson(Map<String, dynamic> json) => BedModel(
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
      json['efficiency'],
      json['socket'] as int?,
      json['luck'],
      json['bonus'],
      json['special'],
      json['resilience'],
      json['classNft'] as String?,
      json['tokenId'] as int,
      json['durability'],
      Nft.fromJson(json['nft'] as Map<String, dynamic>),
      json['jewelType'],
      json['itemType'],
      json['effect'],
      (json['insurancePercent'] as num?)?.toDouble(),
      (json['startTime'] as num?)?.toDouble(),
      (json['endTime'] as num?)?.toDouble(),
      (json['jewels'] as List<dynamic>?)
          ?.map((e) => JewelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BedModelToJson(BedModel instance) => <String, dynamic>{
      'id': instance.id,
      'nftId': instance.nftId,
      'nftName': instance.nftName,
      'image': instance.image,
      'contractAddress': instance.contractAddress,
      'type': instance.type,
      'jewelType': instance.jewelType,
      'itemType': instance.itemType,
      'effect': instance.effect,
      'isMint': instance.isMint,
      'classNft': instance.nftClass,
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
      'durability': instance.durability,
      'socket': instance.socket,
      'jewels': instance.jewels?.map((e) => e.toJson()).toList(),
      'tokenId': instance.tokenId,
      'nft': instance.nft.toJson(),
      'insurancePercent': instance.insurancePercent,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };

Nft _$NftFromJson(Map<String, dynamic> json) => Nft(
      json['id'] as int,
      json['categoryId'] as int,
      json['isLock'] as int,
      json['status'] as String,
    );

Map<String, dynamic> _$NftToJson(Nft instance) => <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'isLock': instance.isLock,
      'status': instance.status,
    };
