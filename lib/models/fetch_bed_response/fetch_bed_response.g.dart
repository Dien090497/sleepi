// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_bed_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerNFTResponse _$OwnerNFTResponseFromJson(Map<String, dynamic> json) =>
    OwnerNFTResponse(
      (json['list'] as List<dynamic>)
          .map((e) => BedModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['count'] as int,
    );

Map<String, dynamic> _$OwnerNFTResponseToJson(OwnerNFTResponse instance) =>
    <String, dynamic>{
      'list': instance.list.map((e) => e.toJson()).toList(),
      'count': instance.count,
    };
