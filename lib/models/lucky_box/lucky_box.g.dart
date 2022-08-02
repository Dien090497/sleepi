// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lucky_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LuckyBox _$LuckyBoxFromJson(Map<String, dynamic> json) => LuckyBox(
      json['id'] as int,
      json['userId'] as int,
      json['level'] as int,
      json['waitingTime'] as String,
      json['speedUpCost'] as String,
      json['redrawRate'] as String,
      json['openingCost'] as String,
      json['typeGift'] as String,
      json['symbol'] as String?,
      json['amount'] as String?,
      json['nftId'] as int?,
      json['isOpen'] as int,
      json['createdAt'] as String,
      json['updatedAt'] as String,
      json['image'] as String,
      json['lucky_box_type'] as String,
    );

Map<String, dynamic> _$LuckyBoxToJson(LuckyBox instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'level': instance.level,
      'waitingTime': instance.waitingTime,
      'speedUpCost': instance.speedUpCost,
      'redrawRate': instance.redrawRate,
      'openingCost': instance.openingCost,
      'typeGift': instance.typeGift,
      'symbol': instance.symbol,
      'amount': instance.amount,
      'nftId': instance.nftId,
      'isOpen': instance.isOpen,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'image': instance.image,
      'lucky_box_type': instance.luckyBoxType,
    };
