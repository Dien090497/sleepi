// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_spending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenSpending _$TokenSpendingFromJson(Map<String, dynamic> json) =>
    TokenSpending(
      json['symbol'] as String,
      json['amount'] as String,
      json['userId'] as int,
      json['availableAmount'] as String,
      json['wallet'] as String,
      json['tokenAddress'] as String,
    );

Map<String, dynamic> _$TokenSpendingToJson(TokenSpending instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'amount': instance.amount,
      'userId': instance.userId,
      'availableAmount': instance.availableAmount,
      'wallet': instance.wallet,
      'tokenAddress': instance.tokenAddress,
    };
