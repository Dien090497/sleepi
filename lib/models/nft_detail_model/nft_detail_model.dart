import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'nft_detail_model.g.dart';

@JsonSerializable()
class NftDetailModel {
  final int id;

  @JsonKey(name: 'category_id')
  final int? categoryId;

  @JsonKey(name: 'is_lock')
  final int isLock;

  final String? status;

  @JsonKey(name: 'created_at')
  final DateTime? createdAtt;

  @JsonKey(name: 'updated_at')
  final DateTime? updatedAtt;

  @JsonKey(name: 'nft_id')
  final int nftId;

  @JsonKey(name: 'nft_name')
  final String nftName;

  final String image;

  @JsonKey(name: 'contract_address')
  final String contractAddress;
  final String type;

  @JsonKey(name: 'is_mint')
  final int isMint;

  @JsonKey(name: 'is_burn')
  final int isBurn;
  final String class_;
  final String quality;
  final String? owner;
  final int time;
  final int level;

  @JsonKey(name: 'bed_mint')
  final int bedMint;
  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;

  @JsonKey(name: 'token_id')
  final int tokenId;
  final double durability;
  final String category;

  NftDetailModel(
    this.id,
    this.categoryId,
    this.isLock,
    this.status,
    this.createdAtt,
    this.updatedAtt,
    this.nftId,
    this.nftName,
    this.image,
    this.contractAddress,
    this.type,
    this.isMint,
    this.isBurn,
    this.class_,
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
    this.tokenId,
    this.durability,
    this.category,
  );

  factory NftDetailModel.fromJson(Map<String, dynamic> json) =>
      _$NftDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftDetailModelToJson(this);

  BedEntity toEntity() => BedEntity(
        name: nftName,
        nftClass: class_,
        nftId: nftId,
        id: id,
        tokenId: tokenId,
        level: level,
        image: image,
        type: type,
        contractAddress: contractAddress,
        quality: quality,
        durability: durability,
        isLock: isLock,
        bedMint: bedMint,
        efficiency: efficiency,
        luck: luck,
        bonus: bonus,
        special: special,
        resilience: resilience,
        time: time,
        isMint: isMint,
      );
}