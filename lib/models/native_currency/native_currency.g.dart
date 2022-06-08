// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NativeCurrency _$NativeCurrencyFromJson(Map<String, dynamic> json) =>
    NativeCurrency(
      json['name'] as String,
      json['symbol'] as String,
      json['decimals'] as int,
    );

Map<String, dynamic> _$NativeCurrencyToJson(NativeCurrency instance) =>
    <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'decimals': instance.decimals,
    };
