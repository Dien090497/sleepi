// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketSchema _$MarketSchemaFromJson(Map<String, dynamic> json) => MarketSchema(
      page: json['page'] as int?,
      limit: json['limit'] as int?,
      categoryId: json['categoryId'] as int,
      sortPrice: json['sortPrice'] as String?,
      type: (json['type'] as List<dynamic>?)?.map((e) => e as String).toList(),
      level: json['level'] as int?,
      bedMint: json['bedMint'] as int?,
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
      'level': instance.level,
      'bedMint': instance.bedMint,
      'classNft': instance.classNft,
      'quality': instance.quality,
    };
