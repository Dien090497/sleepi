// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lucky_box_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OpenLuckyBoxResponse _$OpenLuckyBoxResponseFromJson(
        Map<String, dynamic> json) =>
    OpenLuckyBoxResponse(
      json['status'] as String,
      json['gift'] as String,
    );

Map<String, dynamic> _$OpenLuckyBoxResponseToJson(
        OpenLuckyBoxResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'gift': instance.gift,
    };
