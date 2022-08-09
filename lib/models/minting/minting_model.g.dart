// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'minting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MintingModel _$MintingModelFromJson(Map<String, dynamic> json) => MintingModel(
      status: json['status'] as bool,
      nftAttribute: json['nftAttribute'] == null
          ? null
          : NftAttributeMinting.fromJson(
              json['nftAttribute'] as Map<String, dynamic>),
      msg: json['msg'] as String,
    );

Map<String, dynamic> _$MintingModelToJson(MintingModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'nftAttribute': instance.nftAttribute?.toJson(),
      'msg': instance.msg,
    };
