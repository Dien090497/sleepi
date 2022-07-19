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
      (json['efficiency'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      json['classNft'] as String?,
      json['tokenId'] as int,
      (json['durability'] as num).toDouble(),
      Nft.fromJson(json['nft'] as Map<String, dynamic>),
      json['jewelType'],
      json['itemType'],
      json['effect'],
      (json['insurancePercent'] as num?)?.toDouble(),
      (json['startTime'] as num?)?.toDouble(),
      (json['endTime'] as num?)?.toDouble(),
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
      'tokenId': instance.tokenId,
      'durability': instance.durability,
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
