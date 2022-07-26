// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftFamilyModel _$NftFamilyModelFromJson(Map<String, dynamic> json) =>
    NftFamilyModel(
      (json['parent'] as List<dynamic>)
          .map((e) => BedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['queryChildren'] as List<dynamic>)
          .map((e) => BedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NftFamilyModelToJson(NftFamilyModel instance) =>
    <String, dynamic>{
      'parent': instance.parent.map((e) => e.toJson()).toList(),
      'queryChildren': instance.queryChildren.map((e) => e.toJson()).toList(),
    };
