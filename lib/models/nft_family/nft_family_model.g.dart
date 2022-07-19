// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftFamilyModel _$NftFamilyModelFromJson(Map<String, dynamic> json) =>
    NftFamilyModel(
      (json['parent'] as List<dynamic>)
          .map((e) => _Data.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['children'] as List<dynamic>)
          .map((e) => _Data.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NftFamilyModelToJson(NftFamilyModel instance) =>
    <String, dynamic>{
      'parent': instance.parent.map((e) => e.toJson()).toList(),
      'children': instance.children.map((e) => e.toJson()).toList(),
    };

_Data _$DataFromJson(Map<String, dynamic> json) => _Data(
      json['id'] as int,
      json['image'] as String,
      json['type'] as String,
    );

Map<String, dynamic> _$DataToJson(_Data instance) => <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'type': instance.type,
    };
