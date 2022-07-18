import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

part 'bed_detail.g.dart';

@JsonSerializable()
class BedDetail {
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
  final dynamic jewelType;

  @JsonKey(name: 'item_type')
  final dynamic itemType;

  @JsonKey(name: 'effect')
  final dynamic effect;

  @JsonKey(name: "is_mint")
  final int isMint;

  @JsonKey(name: 'class')
  final String nftClass;
  final String? quality;
  final String owner;
  final int time;
  final int level;

  @JsonKey(name: 'bed_mint')
  final int bedMint;

  final String efficiency;
  final String luck;
  final String bonus;
  final String special;
  final String resilience;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'token_id')
  final int tokenId;

  final String durability;
  @JsonKey(name: 'is_lock')
  final int isLock;

  final String status;

  int? socket;
  final List<JewelEntity> jewels;
  dynamic itemId;
  final Category category;

  BedDetail(
      this.id,
      this.nftId,
      this.nftName,
      this.image,
      this.contractAddress,
      this.type,
      this.jewelType,
      this.itemType,
      this.effect,
      this.isMint,
      this.nftClass,
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
      this.isLock,
      this.status,
      this.category,
      this.jewels);

  factory BedDetail.fromJson(Map<String, dynamic> json) =>
      _$BedDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BedDetailToJson(this);
}

@JsonSerializable()
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
