// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'probability_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProbabilityConfig _$ProbabilityConfigFromJson(Map<String, dynamic> json) =>
    ProbabilityConfig(
      configs: (json['configs'] as List<dynamic>)
          .map((e) => ConfigInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProbabilityConfigToJson(ProbabilityConfig instance) =>
    <String, dynamic>{
      'configs': instance.configs.map((e) => e.toJson()).toList(),
    };
