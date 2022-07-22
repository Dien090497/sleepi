// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_jewel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListJewelResponse _$ListJewelResponseFromJson(Map<String, dynamic> json) =>
    ListJewelResponse(
      (json['list'] as List<dynamic>)
          .map((e) => JewelModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$ListJewelResponseToJson(ListJewelResponse instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };

ListBedResponse _$ListBedResponseFromJson(Map<String, dynamic> json) =>
    ListBedResponse(
      (json['list'] as List<dynamic>)
          .map((e) => BedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$ListBedResponseToJson(ListBedResponse instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
