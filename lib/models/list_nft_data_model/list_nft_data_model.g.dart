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
    );

Map<String, dynamic> _$ListNftDataModelToJson(ListNftDataModel instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_Meta _$MetaFromJson(Map<String, dynamic> json) => _Meta(
      json['count'] as int,
    );

Map<String, dynamic> _$MetaToJson(_Meta instance) => <String, dynamic>{
      'count': instance.count,
    };
