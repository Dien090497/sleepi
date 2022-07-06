import 'package:json_annotation/json_annotation.dart';

part 'market_place_model.g.dart';

@JsonSerializable()
class MarketPlaceModel {
  final int id;

  @JsonKey(name: 'nft_id')
  final int nftId;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'is_lock')
  final int isLock;

  @JsonKey(name: 'token_id')
  final int tokenId;

  final int time;
  final int level;

  @JsonKey(name: 'bed_mint')
  final int bedMint;

  final int efficiency;
  final int luck;
  final int bonus;
  final int special;
  final int resilience;
  final String price;
  final String symbol;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'nft_name')
  final String nftName;

  final String image;
  @JsonKey(name: 'contract_address')
  final String contractAddress;

  final String type;
  // final String class;
  final String quality;
  final String owner;

  MarketPlaceModel(this.id, this.nftId, this.categoryId, this.isLock, this.tokenId, this.time, this.level, this.bedMint,
      this.efficiency, this.luck, this.bonus, this.special, this.resilience, this.price, this.status, this.createdAt,
      this.updatedAt, this.nftName, this.image, this.contractAddress, this.type, this.quality, this.owner, this.symbol);

  factory MarketPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$MarketPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPlaceModelToJson(this);
}
