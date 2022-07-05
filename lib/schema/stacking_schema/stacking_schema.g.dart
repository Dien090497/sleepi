// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stacking_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StackingSchema _$StackingSchemaFromJson(Map<String, dynamic> json) =>
    StackingSchema(
      json['amount'] as int,
      json['symbol'] as String,
    );

Map<String, dynamic> _$StackingSchemaToJson(StackingSchema instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'symbol': instance.symbol,
    };
