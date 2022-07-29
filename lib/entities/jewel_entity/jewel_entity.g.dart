// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jewel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JewelEntity _$JewelEntityFromJson(Map<String, dynamic> json) => JewelEntity(
      nftName: json['nftName'] as String,
      percentEffect: (json['percentEffect'] as num).toDouble(),
      bonus: json['bonus'] as String,
      special: json['special'] as String,
      id: json['id'] as int,
      image: json['image'] as String,
      type: json['type'] as String,
      level: json['level'] as int,
      jewelType: json['jewelType'] as String,
      nftId: json['nftId'] as int,
      resilience: json['resilience'] as String,
      efficiency: json['efficiency'] as String,
      luck: json['luck'] as String,
      quality: json['quality'] as String?,
    );

Map<String, dynamic> _$JewelEntityToJson(JewelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'nftName': instance.nftName,
      'level': instance.level,
      'percentEffect': instance.percentEffect,
      'nftId': instance.nftId,
      'type': instance.type,
      'jewelType': instance.jewelType,
      'resilience': instance.resilience,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'quality': instance.quality,
    };
