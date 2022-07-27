// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probability_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbabilityConfig _$ProbabilityConfigFromJson(Map<String, dynamic> json) =>
    ProbabilityConfig(
      bed: (json['Bed'] as List<dynamic>)
          .map((e) => ConfigInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      token: (json['Token'] as List<dynamic>)
          .map((e) => ConfigInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['Items'] as List<dynamic>)
          .map((e) => ConfigInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
      jewels: (json['Jewels'] as List<dynamic>)
          .map((e) => ConfigInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProbabilityConfigToJson(ProbabilityConfig instance) =>
    <String, dynamic>{
      'Bed': instance.bed.map((e) => e.toJson()).toList(),
      'Token': instance.token.map((e) => e.toJson()).toList(),
      'Items': instance.items.map((e) => e.toJson()).toList(),
      'Jewels': instance.jewels.map((e) => e.toJson()).toList(),
    };
