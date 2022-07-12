

import 'package:json_annotation/json_annotation.dart';


part 'item_model.g.dart';
@JsonSerializable()
class ItemModel{

  final int id;
  @JsonKey(name: 'nft_id')
  final int nftId;
  @JsonKey(name: 'nft_name')
  final String nftName;
  final String image;
  @JsonKey(name: 'contract_address')
  final String contractAddress;
  final String type;
  @JsonKey(name: 'jewel_type')
  dynamic jewelType;
  @JsonKey(name: 'class')
  dynamic classBed;
  @JsonKey(name: "is_mint")
  final int isMint;
  final String? quality;
  final String owner;
  final int time;
  final int level;
  @JsonKey(name: 'bed_mint')
  final int bedMint;
  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'token_id')
  final int tokenId;
  final double durability;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'is_lock')
  final int isLock;
  final String status;

  ItemModel(
      this.id,
      this.nftId,
      this.nftName,
      this.image,
      this.contractAddress,
      this.type,
      this.isMint,
      this.quality,
      this.owner,
      this.time,
      this.level,
      this.bedMint,
      this.efficiency,
      this.luck,
      this.bonus,
      this.special,
      this.resilience,
      this.createdAt,
      this.updatedAt,
      this.tokenId,
      this.durability,
      this.categoryId,
      this.isLock,
      this.status);

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}