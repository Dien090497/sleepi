// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_bed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBedResponse _$HomeBedResponseFromJson(Map<String, dynamic> json) =>
    HomeBedResponse(
      (json['list'] as List<dynamic>)
          .map((e) => BedModelHome.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$HomeBedResponseToJson(HomeBedResponse instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
