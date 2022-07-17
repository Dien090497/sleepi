import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

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

  final double? insurancePercent;

  final double? startTime;

  final double? endTime;

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
      this.nftClass,
      this.createdAt,
      this.updatedAt,
      this.tokenId,
      this.durability,
      this.categoryId,
      this.isLock,
      this.status,
      this.jewelType,
      this.itemType,
      this.effect,
      this.insurancePercent,
      this.startTime,
      this.endTime);

  factory BedModel.fromJson(Map<String, dynamic> json) =>
      _$BedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BedModelToJson(this);

  JewelEntity toJewelEntity() {
    return JewelEntity(
        id: id,
        image: image,
        level: level,
        nftId: nftId,
        luck: luck.toString(),
        efficiency: efficiency.toString(),
        quality: quality.toString(),
        resilience: resilience.toString());
  }

  BedEntity toEntity() {
    return BedEntity(
      name: nftName,
      nftId: nftId,
      nftClass: nftClass,
      tokenId: tokenId,
      id: nftId,
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
      time: time,
      startTime: startTime,
      endTime: endTime,
      insurancePercent: insurancePercent,
    );
  }
}
