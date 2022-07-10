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
      json['jewel_type'] as String,
      json['is_mint'] as int,
      json['quality'] as String,
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
      json['tokenId'] as int,
      json['durability'] as int,
      json['categoryId'] as int,
      json['isLock'] as int,
      json['status'] as String,
    )..jewelType = json['jewelType'];

Map<String, dynamic> _$BedModelToJson(BedModel instance) => <String, dynamic>{
      'id': instance.id,
      'nft_id': instance.nftId,
      'nft_name': instance.nftName,
      'image': instance.image,
      'contract_address': instance.contractAddress,
      'jewel_type': instance.type,
      'jewelType': instance.jewelType,
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
      'tokenId': instance.tokenId,
      'durability': instance.durability,
      'categoryId': instance.categoryId,
      'isLock': instance.isLock,
      'status': instance.status,
    };
