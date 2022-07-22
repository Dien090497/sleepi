// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_bed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigBed _$ConfigBedFromJson(Map<String, dynamic> json) => ConfigBed(
      common: (json['Common'] as num?)?.toDouble(),
      epicBed: json['Epic_Bed'] as int?,
      uncommon: (json['Uncommon'] as num?)?.toDouble(),
      legendaryBed: json['Legendaly_Bed'] as int?,
    );

Map<String, dynamic> _$ConfigBedToJson(ConfigBed instance) => <String, dynamic>{
      'Common': instance.common,
      'Epic_Bed': instance.epicBed,
      'Uncommon': instance.uncommon,
      'Legendaly_Bed': instance.legendaryBed,
    };
