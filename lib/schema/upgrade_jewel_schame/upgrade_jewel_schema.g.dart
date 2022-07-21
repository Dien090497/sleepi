// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_jewel_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeSchema _$UpgradeSchemaFromJson(Map<String, dynamic> json) =>
    UpgradeSchema(
      (json['nftIds'] as List<dynamic>).map((e) => e as String).toList(),
      $enumDecode(_$CategoryTypeEnumMap, json['upgradeType']),
    );

Map<String, dynamic> _$UpgradeSchemaToJson(UpgradeSchema instance) =>
    <String, dynamic>{
      'nftIds': instance.nftIds,
      'upgradeType': _$CategoryTypeEnumMap[instance.upgradeType]!,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.bed: 'bed',
  CategoryType.jewel: 'jewel',
  CategoryType.item: 'item',
};
