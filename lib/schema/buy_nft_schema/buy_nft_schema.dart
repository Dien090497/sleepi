
import 'package:freezed_annotation/freezed_annotation.dart';

part 'buy_nft_schema.g.dart';
@JsonSerializable()
class BuyNFTSchema{
  final int nftId;

  BuyNFTSchema(this.nftId);


  factory BuyNFTSchema.fromJson(Map<String, dynamic> json) =>
      _$BuyNFTSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$BuyNFTSchemaToJson(this);

}