// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_nft_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListNftDataModel _$ListNftDataModelFromJson(Map<String, dynamic> json) =>
    ListNftDataModel(
      (json['data'] as List<dynamic>)
          .map((e) => NftDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      _Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ListNftDataModelToJson(ListNftDataModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
      json['itemCount'] as int,
      json['totalItem'] as int,
      json['itemsPerPage'] as int,
      json['totalPages'] as int,
      json['currentPage'] as int,
    );

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
      'itemCount': instance.itemCount,
      'totalItem': instance.totalItem,
      'itemsPerPage': instance.itemsPerPage,
      'totalPages': instance.totalPages,
      'currentPage': instance.currentPage,
    };
