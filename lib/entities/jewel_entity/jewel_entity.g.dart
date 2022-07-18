// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JewelEntity _$JewelEntityFromJson(Map<String, dynamic> json) => JewelEntity(
      id: json['id'] as int,
      image: json['image'] as String,
      level: json['level'] as int,
      nftId: json['nftId'] as int,
      resilience: json['resilience'] as String,
      efficiency: json['efficiency'] as String,
      luck: json['luck'] as String,
      quality: json['quality'] as String,
    );

Map<String, dynamic> _$JewelEntityToJson(JewelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'level': instance.level,
      'nftId': instance.nftId,
      'resilience': instance.resilience,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'quality': instance.quality,
    };
