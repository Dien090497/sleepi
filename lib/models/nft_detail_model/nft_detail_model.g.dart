// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftDetailModel _$NftDetailModelFromJson(Map<String, dynamic> json) =>
    NftDetailModel(
      json['id'] as int?,
      json['category_id'] as int?,
      json['is_lock'] as int?,
      json['status'] as String?,
      json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      json['nft_id'] as int,
      json['nft_name'] as String,
      json['image'] as String,
      json['contract_address'] as String,
      json['type'] as String,
      json['is_mint'] as int?,
      json['is_burn'] as int?,
      json['class_'] as String,
      json['quality'] as String,
      json['owner'] as String?,
      json['time'] as int,
      json['level'] as int,
      json['bed_mint'] as int,
      (json['efficiency'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      json['token_id'] as int,
      (json['durability'] as num).toDouble(),
      json['category'] as String,
    );

Map<String, dynamic> _$NftDetailModelToJson(NftDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_id': instance.categoryId,
      'is_lock': instance.isLock,
      'status': instance.status,
      'created_at': instance.createdAtt?.toIso8601String(),
      'updated_at': instance.updatedAtt?.toIso8601String(),
      'nft_id': instance.nftId,
      'nft_name': instance.nftName,
      'image': instance.image,
      'contract_address': instance.contractAddress,
      'type': instance.type,
      'is_mint': instance.isMint,
      'is_burn': instance.isBurn,
      'class_': instance.class_,
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
      'token_id': instance.tokenId,
      'durability': instance.durability,
      'category': instance.category,
    };
