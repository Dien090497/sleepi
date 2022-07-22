// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_probability_config_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaProbabilityConfigResponse _$GachaProbabilityConfigResponseFromJson(
        Map<String, dynamic> json) =>
    GachaProbabilityConfigResponse(
      status: json['status'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProbabilityData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GachaProbabilityConfigResponseToJson(
        GachaProbabilityConfigResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
