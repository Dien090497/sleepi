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
      (json['efficiency'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      json['class'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['token_id'] as int,
      (json['durability'] as num).toDouble(),
      json['category_id'] as int,
      json['is_lock'] as int,
      json['status'] as String,
      json['jewel_type'],
      json['item_type'],
      json['effect'],
      json['insurancePercent'] as int,
      json['startTime'] as int,
      json['endTime'] as int,
    );

Map<String, dynamic> _$BedModelToJson(BedModel instance) => <String, dynamic>{
      'id': instance.id,
      'nft_id': instance.nftId,
      'nft_name': instance.nftName,
      'image': instance.image,
      'contract_address': instance.contractAddress,
      'type': instance.type,
      'jewel_type': instance.jewelType,
      'item_type': instance.itemType,
      'effect': instance.effect,
      'is_mint': instance.isMint,
      'class': instance.nftClass,
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
      'insurancePercent': instance.insurancePercent,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };
