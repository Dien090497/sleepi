// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repair_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepairSchema _$RepairSchemaFromJson(Map<String, dynamic> json) => RepairSchema(
      bedId: json['bedId'] as int,
      tokenAddress: json['token_address'] as String,
      cost: (json['cost'] as num).toDouble(),
    );

Map<String, dynamic> _$RepairSchemaToJson(RepairSchema instance) =>
    <String, dynamic>{
      'bedId': instance.bedId,
      'token_address': instance.tokenAddress,
      'cost': instance.cost,
    };
