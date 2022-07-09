// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unstacking_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnStackingSchema _$UnStackingSchemaFromJson(Map<String, dynamic> json) =>
    UnStackingSchema(
      json['amount'] as int,
      json['symbol'] as String,
    );

Map<String, dynamic> _$UnStackingSchemaToJson(UnStackingSchema instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'symbol': instance.symbol,
    };
