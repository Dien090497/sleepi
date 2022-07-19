// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bed_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BedDetail _$BedDetailFromJson(Map<String, dynamic> json) => BedDetail(
      json['id'] as int,
      json['nft_id'] as int,
      json['nft_name'] as String,
      json['image'] as String,
      json['contract_address'] as String,
      json['type'] as String,
      json['jewel_type'],
      json['item_type'],
      json['effect'],
      json['is_mint'] as int,
      json['class'] as String,
      json['quality'] as String?,
      json['owner'] as String,
      json['time'] as int,
      json['level'] as int,
      json['bed_mint'] as int,
      json['efficiency'] as String,
      json['luck'] as String,
      json['bonus'] as String,
      json['special'] as String,
      json['resilience'] as String,
      json['created_at'] as String,
      json['updated_at'] as String,
      json['token_id'] as int,
      json['durability'] as String,
      json['is_lock'] as int,
      json['status'] as String,
      Category.fromJson(json['category'] as Map<String, dynamic>),
      (json['jewels'] as List<dynamic>)
          .map((e) => JewelEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['insurancePercent'] as num?)?.toDouble(),
      (json['startTime'] as num?)?.toDouble(),
      (json['endTime'] as num?)?.toDouble(),
    )
      ..socket = json['socket'] as int?
      ..itemId = json['itemId'];

Map<String, dynamic> _$BedDetailToJson(BedDetail instance) => <String, dynamic>{
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
      'is_lock': instance.isLock,
      'status': instance.status,
      'socket': instance.socket,
      'jewels': instance.jewels.map((e) => e.toJson()).toList(),
      'itemId': instance.itemId,
      'category': instance.category.toJson(),
      'insurancePercent': instance.insurancePercent,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
