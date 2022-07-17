// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_item_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterItemSchema _$FilterItemSchemaFromJson(Map<String, dynamic> json) =>
    FilterItemSchema(
      page: json['page'] as int,
      limit: json['limit'] as int,
      maxLevel: json['maxLevel'] as int,
      minLevel: json['minLevel'] as int,
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FilterItemSchemaToJson(FilterItemSchema instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'minLevel': instance.minLevel,
      'maxLevel': instance.maxLevel,
      'type': instance.type,
    };
