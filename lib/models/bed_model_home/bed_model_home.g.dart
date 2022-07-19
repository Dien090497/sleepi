// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bed_model_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BedModelHome _$BedModelHomeFromJson(Map<String, dynamic> json) => BedModelHome(
      json['id'] as int,
      json['nftId'] as int,
      json['nftName'] as String,
      json['contractAddress'] as String,
      json['tokenId'] as int,
      json['owner'] as String,
      json['type'] as String,
      json['classNft'] as String?,
      json['quality'] as String,
      json['image'] as String,
      json['time'] as int,
      json['level'] as int,
      json['bedMint'] as int,
      json['isMint'] as int,
      json['isBurn'] as int,
      (json['efficiency'] as num).toDouble(),
      (json['durability'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      Nft.fromJson(json['nft'] as Map<String, dynamic>),
      ObjData.fromJson(json['objData'] as Map<String, dynamic>),
    )
      ..parent1 = json['parent1']
      ..parent2 = json['parent2']
      ..jewelType = json['jewelType']
      ..itemType = json['itemType'];

Map<String, dynamic> _$BedModelHomeToJson(BedModelHome instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nftId': instance.nftId,
      'nftName': instance.nftName,
      'parent1': instance.parent1,
      'parent2': instance.parent2,
      'contractAddress': instance.contractAddress,
      'tokenId': instance.tokenId,
      'owner': instance.owner,
      'type': instance.type,
      'jewelType': instance.jewelType,
      'itemType': instance.itemType,
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
      'nft': instance.nft.toJson(),
      'objData': instance.objData.toJson(),
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

ObjData _$ObjDataFromJson(Map<String, dynamic> json) => ObjData(
      (json['insurancePercent'] as num).toDouble(),
      (json['startTime'] as num).toDouble(),
      (json['endTime'] as num).toDouble(),
    );

Map<String, dynamic> _$ObjDataToJson(ObjData instance) => <String, dynamic>{
      'insurancePercent': instance.insurancePercent,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
