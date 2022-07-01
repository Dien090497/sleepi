
import 'package:freezed_annotation/freezed_annotation.dart';
part 'buy_nft_schema.g.dart';
@JsonSerializable()
class BuyNFTSchema{
  // "buyerId": 0,
  // "sellerId": 0,
  // "nftId": 0
  final int buyerId;
  final int sellerId;
  final int nftId;

  BuyNFTSchema(this.buyerId, this.sellerId, this.nftId);


  factory BuyNFTSchema.fromJson(Map<String, dynamic> json) =>
      _$BuyNFTSchemaFromJson(json);

  Map<String, dynamic> toJson() => _$BuyNFTSchemaToJson(this);

}