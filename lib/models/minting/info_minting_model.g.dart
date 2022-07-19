// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_minting_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoMintingModel _$InfoMintingModelFromJson(Map<String, dynamic> json) =>
    InfoMintingModel(
      fee: json['fee'] as int,
      percentMinting: (json['percentMinting'] as List<dynamic>)
          .map((e) => PercentMinting.fromJson(e as Map<String, dynamic>))
          .toList(),
      randomQuality: json['randomQuality'] as String,
      brokenRate:
          BrokenRate.fromJson(json['brokenRate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$InfoMintingModelToJson(InfoMintingModel instance) =>
    <String, dynamic>{
      'fee': instance.fee,
      'percentMinting': instance.percentMinting.map((e) => e.toJson()).toList(),
      'randomQuality': instance.randomQuality,
      'brokenRate': instance.brokenRate.toJson(),
    };
