// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_jewel_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeJewelSchema _$UpgradeJewelSchemaFromJson(Map<String, dynamic> json) =>
    UpgradeJewelSchema(
      (json['nftIds'] as List<dynamic>).map((e) => e as String).toList(),
      json['upgradeType'] as int,
    );

Map<String, dynamic> _$UpgradeJewelSchemaToJson(UpgradeJewelSchema instance) =>
    <String, dynamic>{
      'nftIds': instance.nftIds,
      'upgradeType': instance.upgradeType,
    };
