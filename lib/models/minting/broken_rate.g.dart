// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'broken_rate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrokenRate _$BrokenRateFromJson(Map<String, dynamic> json) => BrokenRate(
      parent1: json['parent1'] as String,
      parent2: json['parent2'] as String,
      fee: json['fee'] as int,
      brokenRate: json['brokenRate'] as int,
    );

Map<String, dynamic> _$BrokenRateToJson(BrokenRate instance) =>
    <String, dynamic>{
      'parent1': instance.parent1,
      'parent2': instance.parent2,
      'fee': instance.fee,
      'brokenRate': instance.brokenRate,
    };
