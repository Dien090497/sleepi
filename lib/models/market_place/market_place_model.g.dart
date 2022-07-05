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
      json['token_id'] as int,
      json['time'] as int,
      json['level'] as int,
      json['bed_mint'] as int,
      json['efficiency'] as int,
      json['luck'] as int,
      json['bonus'] as int,
      json['special'] as int,
      json['resilience'] as int,
      json['price'] as String,
      json['status'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['nft_name'] as String,
      json['image'] as String,
      json['contract_address'] as String,
      json['type'] as String,
      json['quality'] as String,
      json['owner'] as String,
    );

Map<String, dynamic> _$MarketPlaceModelToJson(MarketPlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nft_id': instance.nftId,
      'category_id': instance.categoryId,
      'is_lock': instance.isLock,
      'token_id': instance.tokenId,
      'time': instance.time,
      'level': instance.level,
      'bed_mint': instance.bedMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'price': instance.price,
      'status': instance.status,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'nft_name': instance.nftName,
      'image': instance.image,
      'contract_address': instance.contractAddress,
      'type': instance.type,
      'quality': instance.quality,
      'owner': instance.owner,
    };
