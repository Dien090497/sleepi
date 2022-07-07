// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'swap_token_to_wallet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SwapTokenToWalletResponse _$SwapTokenToWalletResponseFromJson(
        Map<String, dynamic> json) =>
    SwapTokenToWalletResponse(
      json['type'] as String,
      json['tokenAddress'] as String,
      json['amount'] as String,
      json['mainWallet'] as String,
      json['status'] as String,
      json['userId'] as int,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$SwapTokenToWalletResponseToJson(
        SwapTokenToWalletResponse instance) =>
    <String, dynamic>{
      'type': instance.type,
      'tokenAddress': instance.tokenAddress,
      'amount': instance.amount,
      'mainWallet': instance.mainWallet,
      'status': instance.status,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'id': instance.id,
    };
