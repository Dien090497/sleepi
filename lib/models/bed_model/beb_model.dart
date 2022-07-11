import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'beb_model.g.dart';

@JsonSerializable()
class BedModel {
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
  final String quality;
  final String owner;
  final int time;
  final int level;
  @JsonKey(name: 'bed_mint')
  final int bedMint;
  final int efficiency;
  final int luck;
  final int bonus;
  final int special;
  final int resilience;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  @JsonKey(name: 'token_id')
  final int tokenId;
  final int durability;
  @JsonKey(name: 'category_id')
  final int categoryId;
  @JsonKey(name: 'is_lock')
  final int isLock;
  final String status;

  BedModel(
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

  factory BedModel.fromJson(Map<String, dynamic> json) =>
      _$BedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BedModelToJson(this);

  BedEntity toEntity() {
    return BedEntity(
        name: nftName,
        id: id,
        level: level,
        image: image,
        contractAddress: contractAddress,
        durability: durability,
        isLock: isLock,
        bedMint: bedMint,
        quality: quality,
        type: type,
        efficiency: efficiency,
        luck: luck,
        bonus: bonus,
        isMint: isMint,
        special: special,
        resilience: resilience,
        time: time);
  }
}