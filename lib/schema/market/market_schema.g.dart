// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketSchema _$MarketSchemaFromJson(Map<String, dynamic> json) => MarketSchema(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      minBedMint: (json['minBedMint'] as num?)?.toDouble() ?? 0,
      maxBedMint: (json['maxBedMint'] as num?)?.toDouble() ?? 5,
      maxLevel: (json['maxLevel'] as num?)?.toDouble() ?? 30,
      minLevel: (json['minLevel'] as num?)?.toDouble() ?? 0,
      categoryId: json['categoryId'] as int,
      sortPrice: json['sortPrice'] as String?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      classNft: (json['classNft'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      quality:
          (json['quality'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$MarketSchemaToJson(MarketSchema instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'categoryId': instance.categoryId,
      'sortPrice': instance.sortPrice,
      'type': instance.type,
      'minLevel': instance.minLevel,
      'maxLevel': instance.maxLevel,
      'minBedMint': instance.minBedMint,
      'maxBedMint': instance.maxBedMint,
      'classNft': instance.classNft,
      'quality': instance.quality,
    };
