// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_spin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaSpinResponse _$GachaSpinResponseFromJson(Map<String, dynamic> json) =>
    GachaSpinResponse(
      status: json['status'] as String,
      gift: (json['gift'] as List<dynamic>)
          .map((e) => (e as List<dynamic>)
              .map((e) => GachaGift.fromJson(e as Map<String, dynamic>))
              .toList())
          .toList(),
    );

Map<String, dynamic> _$GachaSpinResponseToJson(GachaSpinResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'gift':
          instance.gift.map((e) => e.map((e) => e.toJson()).toList()).toList(),
    };
