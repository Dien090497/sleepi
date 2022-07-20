// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketPlaceModel _$MarketPlaceModelFromJson(Map<String, dynamic> json) =>
    MarketPlaceModel(
      json['id'] as int,
      json['nftId'] as int,
      json['category_id'] as int,
      json['isLock'] as int?,
      json['time'] as int,
      json['level'] as int,
      json['bedMint'] as int,
      json['efficiency'] as String,
      json['luck'] as String,
      json['bonus'] as String,
      json['special'] as String,
      json['resilience'] as String,
      json['price'] as String,
      json['status'] as String,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['nftName'] as String,
      json['image'] as String,
      json['contractAddress'] as String,
      json['type'] as String,
      json['quality'] as String?,
      json['owner'] as String,
      json['symbol'] as String,
      json['classNft'] as String?,
      json['durability'] as String,
      json['isMint'] as int,
      json['tokenId'] as int,
      (json['startTime'] as num?)?.toDouble(),
      (json['endTime'] as num?)?.toDouble(),
      json['jewelType'] as String?,
    );

Map<String, dynamic> _$MarketPlaceModelToJson(MarketPlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nftId': instance.nftId,
      'category_id': instance.categoryId,
      'isLock': instance.isLock,
      'time': instance.time,
      'level': instance.level,
      'bedMint': instance.bedMint,
      'isMint': instance.isMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'durability': instance.durability,
      'jewelType': instance.jewelType,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'price': instance.price,
      'symbol': instance.symbol,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'nftName': instance.nftName,
      'image': instance.image,
      'contractAddress': instance.contractAddress,
      'type': instance.type,
      'classNft': instance.classNft,
      'quality': instance.quality,
      'owner': instance.owner,
      'tokenId': instance.tokenId,
    };
