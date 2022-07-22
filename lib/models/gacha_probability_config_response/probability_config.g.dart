// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probability_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbabilityConfig _$ProbabilityConfigFromJson(Map<String, dynamic> json) =>
    ProbabilityConfig(
      bed: ConfigBed.fromJson(json['Bed'] as Map<String, dynamic>),
      slft: ConfigSlft.fromJson(json['slft'] as Map<String, dynamic>),
      items: ConfigItems.fromJson(json['Items'] as Map<String, dynamic>),
      jewels: ConfigJewels.fromJson(json['Jewels'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProbabilityConfigToJson(ProbabilityConfig instance) =>
    <String, dynamic>{
      'Bed': instance.bed.toJson(),
      'slft': instance.slft.toJson(),
      'Items': instance.items.toJson(),
      'Jewels': instance.jewels.toJson(),
    };
