// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_gift.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaGift _$GachaGiftFromJson(Map<String, dynamic> json) => GachaGift(
      type: json['type'] as String,
      attributes: GachaAttributesItem.fromJson(
          json['attributes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GachaGiftToJson(GachaGift instance) => <String, dynamic>{
      'type': instance.type,
      'attributes': instance.attributes.toJson(),
    };
