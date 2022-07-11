// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketPlaceModel _$MarketPlaceModelFromJson(Map<String, dynamic> json) =>
    MarketPlaceModel(
      json['id'] as int,
      json['nft_id'] as int,
      json['category_id'] as int,
      json['is_lock'] as int,
      json['time'] as int,
      json['level'] as int,
      json['bed_mint'] as int,
      (json['efficiency'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      json['price'] as String,
      json['status'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['nft_name'] as String,
      json['image'] as String,
      json['contract_address'] as String,
      json['type'] as String,
      json['quality'] as String?,
      json['owner'] as String,
      json['symbol'] as String,
      json['class'] as String?,
      (json['durability'] as num).toDouble(),
      json['is_mint'] as int,
    );

Map<String, dynamic> _$MarketPlaceModelToJson(MarketPlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nft_id': instance.nftId,
      'category_id': instance.categoryId,
      'is_lock': instance.isLock,
      'time': instance.time,
      'level': instance.level,
      'bed_mint': instance.bedMint,
      'is_mint': instance.isMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'durability': instance.durability,
      'price': instance.price,
      'symbol': instance.symbol,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'nft_name': instance.nftName,
      'image': instance.image,
      'contract_address': instance.contractAddress,
      'type': instance.type,
      'class': instance.classNft,
      'quality': instance.quality,
      'owner': instance.owner,
    };
