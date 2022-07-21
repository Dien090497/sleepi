// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upgrade_jewel_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpgradeJewelResponse _$UpgradeJewelResponseFromJson(
        Map<String, dynamic> json) =>
    UpgradeJewelResponse(
      json['status'] as bool,
      json['msg'] as String,
      BedModel.fromJson(json['nftAttribute'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpgradeJewelResponseToJson(
        UpgradeJewelResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'msg': instance.msg,
      'nftAttribute': instance.nftAttribute.toJson(),
    };
