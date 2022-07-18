// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_point_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdatePointSchema _$UpdatePointSchemaFromJson(Map<String, dynamic> json) =>
    UpdatePointSchema(
      bedId: (json['bedId'] as num).toDouble(),
      efficiency: (json['efficiency'] as num).toDouble(),
      luck: (json['luck'] as num).toDouble(),
      bonus: (json['bonus'] as num).toDouble(),
      special: (json['special'] as num).toDouble(),
      resilience: (json['resilience'] as num).toDouble(),
    );

Map<String, dynamic> _$UpdatePointSchemaToJson(UpdatePointSchema instance) =>
    <String, dynamic>{
      'bedId': instance.bedId,
      'efficiency': instance.efficiency,
      'luck': instance.luck,
      'bonus': instance.bonus,
      'special': instance.special,
      'resilience': instance.resilience,
    };
