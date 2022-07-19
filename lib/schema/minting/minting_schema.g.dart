// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minting_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MintingSchema _$MintingSchemaFromJson(Map<String, dynamic> json) =>
    MintingSchema(
      bedIdParent1: json['bedIdParent1'] as int,
      bedIdParent2: json['bedIdParent2'] as int,
      isInsurance: json['isInsurance'] as int,
    );

Map<String, dynamic> _$MintingSchemaToJson(MintingSchema instance) =>
    <String, dynamic>{
      'bedIdParent1': instance.bedIdParent1,
      'bedIdParent2': instance.bedIdParent2,
      'isInsurance': instance.isInsurance,
    };
