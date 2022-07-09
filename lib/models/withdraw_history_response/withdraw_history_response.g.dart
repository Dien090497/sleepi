// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdraw_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawHistoryResponse _$WithdrawHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    WithdrawHistoryResponse(
      (json['data'] as List<dynamic>)
          .map((e) =>
              SwapTokenToWalletResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['page'] as int,
      json['totalItem'] as int,
    );

Map<String, dynamic> _$WithdrawHistoryResponseToJson(
        WithdrawHistoryResponse instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'page': instance.page,
      'totalItem': instance.totalItem,
    };
