// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_owner_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemOwnerResponse _$ItemOwnerResponseFromJson(Map<String, dynamic> json) =>
    ItemOwnerResponse(
      (json['list'] as List<dynamic>)
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$ItemOwnerResponseToJson(ItemOwnerResponse instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
