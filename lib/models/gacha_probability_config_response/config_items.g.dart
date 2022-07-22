// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigItems _$ConfigItemsFromJson(Map<String, dynamic> json) => ConfigItems(
      level1: json['level_1'] as int?,
      level2: (json['level_2'] as num?)?.toDouble(),
      level3: (json['level_3'] as num?)?.toDouble(),
      level4: (json['level_4'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ConfigItemsToJson(ConfigItems instance) =>
    <String, dynamic>{
      'level_1': instance.level1,
      'level_2': instance.level2,
      'level_3': instance.level3,
      'level_4': instance.level4,
    };
