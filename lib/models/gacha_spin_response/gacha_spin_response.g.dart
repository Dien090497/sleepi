// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gacha_spin_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GachaSpinResponse _$GachaSpinResponseFromJson(Map<String, dynamic> json) =>
    GachaSpinResponse(
      status: json['status'] as String,
      gift: json['gift'] as List<dynamic>,
    );

Map<String, dynamic> _$GachaSpinResponseToJson(GachaSpinResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'gift': instance.gift,
    };
