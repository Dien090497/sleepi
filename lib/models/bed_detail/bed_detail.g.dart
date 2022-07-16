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
      (json['efficiency'] as num).toDouble(),
      (json['luck'] as num).toDouble(),
      (json['bonus'] as num).toDouble(),
      (json['special'] as num).toDouble(),
      (json['resilience'] as num).toDouble(),
      json['created_at'] as String,
      json['updated_at'] as String,
      json['token_id'] as int,
      (json['durability'] as num).toDouble(),
      json['category_id'] as int,
      json['is_lock'] as int,
      json['status'] as String,
      (json['insurancePercent'] as num?)?.toDouble(),
      (json['startTime'] as num?)?.toDouble(),
      (json['endTime'] as num?)?.toDouble(),
      Category.fromJson(json['category'] as Map<String, dynamic>),
    )
      ..socket = json['socket']
      ..itemId = json['itemId'] as int?
      ..jewelSlot1 = json['jewelSlot1'] as String?
      ..jewelSlot2 = json['jewelSlot2'] as String?
      ..jewelSlot3 = json['jewelSlot3'] as String?
      ..jewelSlot4 = json['jewelSlot4'] as String?
      ..jewelSlot5 = json['jewelSlot5'] as String?;

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
      'category_id': instance.categoryId,
      'is_lock': instance.isLock,
      'status': instance.status,
      'insurancePercent': instance.insurancePercent,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'socket': instance.socket,
      'itemId': instance.itemId,
      'jewelSlot1': instance.jewelSlot1,
      'jewelSlot2': instance.jewelSlot2,
      'jewelSlot3': instance.jewelSlot3,
      'jewelSlot4': instance.jewelSlot4,
      'jewelSlot5': instance.jewelSlot5,
      'category': instance.category.toJson(),
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
