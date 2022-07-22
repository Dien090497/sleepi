// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probability_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbabilityConfig _$ProbabilityConfigFromJson(Map<String, dynamic> json) =>
    ProbabilityConfig(
      bed: ConfigBed.fromJson(json['bed'] as Map<String, dynamic>),
      slft: ConfigSlft.fromJson(json['slft'] as Map<String, dynamic>),
      items: ConfigItems.fromJson(json['items'] as Map<String, dynamic>),
      jewels: ConfigJewels.fromJson(json['jewels'] as Map<String, dynamic>),
      times: json['times'] as int,
    );

Map<String, dynamic> _$ProbabilityConfigToJson(ProbabilityConfig instance) =>
    <String, dynamic>{
      'bed': instance.bed.toJson(),
      'slft': instance.slft.toJson(),
      'items': instance.items.toJson(),
      'jewels': instance.jewels.toJson(),
      'times': instance.times,
    };
