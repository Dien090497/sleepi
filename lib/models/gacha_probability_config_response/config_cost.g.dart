// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_cost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigCost _$ConfigCostFromJson(Map<String, dynamic> json) => ConfigCost(
      normalGachaSingle: json['NORMAL_GACHA_SINGLE'] as int?,
      normalGachaMultiple: json['NORMAL_GACHA_MULTIPLE'] as int?,
      specialGachaSingle: json['SPECIAL_GACHA_SINGLE'] as int?,
      specialGachaMultiple: json['SPECIAL_GACHA_MULTIPLE'] as int?,
    );

Map<String, dynamic> _$ConfigCostToJson(ConfigCost instance) =>
    <String, dynamic>{
      'NORMAL_GACHA_SINGLE': instance.normalGachaSingle,
      'NORMAL_GACHA_MULTIPLE': instance.normalGachaMultiple,
      'SPECIAL_GACHA_SINGLE': instance.specialGachaSingle,
      'SPECIAL_GACHA_MULTIPLE': instance.specialGachaMultiple,
    };
