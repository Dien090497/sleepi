// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_market_place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListMarketPlaceModel _$ListMarketPlaceModelFromJson(
        Map<String, dynamic> json) =>
    ListMarketPlaceModel(
      (json['list'] as List<dynamic>)
          .map((e) => MarketPlaceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$ListMarketPlaceModelToJson(
        ListMarketPlaceModel instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
