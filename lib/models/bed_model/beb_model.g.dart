// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beb_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BedModel _$BedModelFromJson(Map<String, dynamic> json) => BedModel(
      json['id'] as int,
      json['nft_id'] as int,
      json['nft_name'] as String,
      json['image'] as String,
      json['contract_address'] as String,
      json['type'] as String,
      json['is_mint'] as int,
      json['quality'] as String?,
      json['owner'] as String,
      json['time'] as int,
      json['level'] as int,
      json['bed_mint'] as int,
      json['efficiency'] as int,
      json['luck'] as int,
      json['bonus'] as int,
      json['special'] as int,
      json['resilience'] as int,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['token_id'] as int,
      json['durability'] as int,
      json['category_id'] as int,
      json['is_lock'] as int,
      json['status'] as String,
    )
      ..jewelType = json['jewel_type']
      ..classBed = json['class'];

Map<String, dynamic> _$BedModelToJson(BedModel instance) => <String, dynamic>{
      'id': instance.id,
      'nft_id': instance.nftId,
      'nft_name': instance.nftName,
      'image': instance.image,
      'contract_address': instance.contractAddress,
      'type': instance.type,
      'jewel_type': instance.jewelType,
      'class': instance.classBed,
      'is_mint': instance.isMint,
      'quality': instance.quality,
      'owner': instance.owner,
      'time': instance.time,
      'level': instance.level,
      'bed_mint': instance.bedMint,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'token_id': instance.tokenId,
      'durability': instance.durability,
      'category_id': instance.categoryId,
      'is_lock': instance.isLock,
      'status': instance.status,
    };
