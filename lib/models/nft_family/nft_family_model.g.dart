// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nft_family_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NftFamilyModel _$NftFamilyModelFromJson(Map<String, dynamic> json) =>
    NftFamilyModel(
      queryParent: (json['queryParent'] as List<dynamic>)
          .map((e) => BedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryChildren: (json['queryChildren'] as List<dynamic>)
          .map((e) => BedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NftFamilyModelToJson(NftFamilyModel instance) =>
    <String, dynamic>{
      'queryParent': instance.queryParent.map((e) => e.toJson()).toList(),
      'queryChildren': instance.queryChildren.map((e) => e.toJson()).toList(),
    };
