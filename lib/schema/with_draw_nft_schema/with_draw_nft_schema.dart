import 'package:freezed_annotation/freezed_annotation.dart';

part 'with_draw_nft_schema.g.dart';

@JsonSerializable()
class WithDrawNFTSchema {
  final String type;
  final String contractAddress;
  final String tokenId;
  final String? signedMessage;
  final String? signer;

  WithDrawNFTSchema({
    required this.type,
    required this.contractAddress,
    required this.tokenId,
    this.signedMessage,
    this.signer,
  });

  factory WithDrawNFTSchema.fromJson(Map<String, dynamic> json) =>
      _$WithDrawNFTSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$WithDrawNFTSchemaToJson(this);
}
