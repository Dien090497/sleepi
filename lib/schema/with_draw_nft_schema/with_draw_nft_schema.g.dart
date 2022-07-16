// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'with_draw_nft_schema.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithDrawNFTSchema _$WithDrawNFTSchemaFromJson(Map<String, dynamic> json) =>
    WithDrawNFTSchema(
      type: json['type'] as String,
      contractAddress: json['contractAddress'] as String,
      tokenId: json['tokenId'] as String,
      signedMessage: json['signedMessage'] as String?,
      signer: json['signer'] as String?,
    );

Map<String, dynamic> _$WithDrawNFTSchemaToJson(WithDrawNFTSchema instance) =>
    <String, dynamic>{
      'type': instance.type,
      'contractAddress': instance.contractAddress,
      'tokenId': instance.tokenId,
      'signedMessage': instance.signedMessage,
      'signer': instance.signer,
    };
