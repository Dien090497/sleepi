// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_nft_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNftDataModel _$ListNftDataModelFromJson(Map<String, dynamic> json) =>
    ListNftDataModel(
      (json['data'] as List<dynamic>?)
          ?.map((e) => NftDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListNftDataModelToJson(ListNftDataModel instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
