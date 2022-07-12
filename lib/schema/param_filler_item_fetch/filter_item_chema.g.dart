// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_item_chema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterItemSchema _$FilterItemSchemaFromJson(Map<String, dynamic> json) =>
    FilterItemSchema(
      json['page'] as int,
      json['limit'] as int,
      json['level'] as int,
      (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FilterItemSchemaToJson(FilterItemSchema instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'level': instance.level,
      'type': instance.type,
    };
