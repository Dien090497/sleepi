// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_attributes_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaAttributesItem _$GachaAttributesItemFromJson(Map<String, dynamic> json) =>
    GachaAttributesItem(
      level: (json['level'] as num).toDouble(),
      efficiency: (json['efficiency'] as num).toDouble(),
      luck: (json['luck'] as num).toDouble(),
      bonus: (json['bonus'] as num).toDouble(),
      special: (json['special'] as num).toDouble(),
      resilience: (json['resilience'] as num).toDouble(),
    );

Map<String, dynamic> _$GachaAttributesItemToJson(
        GachaAttributesItem instance) =>
    <String, dynamic>{
      'level': instance.level,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
    };
