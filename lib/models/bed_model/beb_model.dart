import 'dart:core';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/models/jewel_model/jewel_model.dart';

part 'beb_model.g.dart';

@JsonSerializable()
class BedModel {
  final int id;

  final int nftId;

  final String nftName;

  final String image;

  final String contractAddress;

  final String type;

  final String? jewelType;

  final dynamic itemType;

  final dynamic effect;

  final int isMint;

  @JsonKey(name: 'classNft')
  final String? nftClass;
  final String? quality;
  final String owner;
  final int time;
  final int level;

  // @JsonKey(name: 'bed_mint')
  final int bedMint;

  final dynamic efficiency;
  final dynamic luck;
  final dynamic bonus;
  final dynamic special;
  final dynamic resilience;
  final dynamic durability;
  final int? socket;
  final List<JewelModel>? jewels;
  final int tokenId;
  final Nft nft;

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
      this.socket,
      this.luck,
      this.bonus,
      this.special,
      this.resilience,
      this.nftClass,
      this.tokenId,
      this.durability,
      this.nft,
      this.jewelType,
      this.itemType,
      this.effect,
      this.insurancePercent,
      this.startTime,
      this.endTime,
      this.jewels);

  factory BedModel.fromJson(Map<String, dynamic> json) =>
      _$BedModelFromJson(json);

  Map<String, dynamic> toJson() => _$BedModelToJson(this);

  JewelEntity toJewelEntity() {
    return JewelEntity(
        bonus: bonus,
        special: special,
        jewelType: jewelType ?? '',
        id: id,
        image: image,
        level: level,
        nftId: nftId,
        type: type,
        luck: luck.toString(),
        efficiency: efficiency.toString(),
        quality: quality.toString(),
        resilience: resilience.toString());
  }

  BedEntity toEntity() {
    return BedEntity(
      jewelType: jewelType,
      name: nftName,
      nftId: nftId,
      nftClass: nftClass ?? '',
      tokenId: tokenId,
      id: nftId,
      level: level,
      image: image,
      contractAddress: contractAddress,
      isLock: nft.isLock,
      bedMint: bedMint,
      quality: quality,
      type: type,
      isMint: isMint,
      efficiency: double.parse('$efficiency'),
      luck: double.parse('$luck'),
      bonus: double.parse('$bonus'),
      special: double.parse('$special'),
      resilience: double.parse('$resilience'),
      durability: double.parse('$durability'),
      time: time,
      startTime: startTime,
      endTime: endTime,
      insurancePercent: insurancePercent,
      socket: socket,
      jewels: jewels != null ? jewels!.map((e) => e.toEntity()).toList() : [],
      owner: owner,
      status: nft.status,
    );
  }
}

@JsonSerializable()
class Nft {
  final int id;
  final int categoryId;
  final int isLock;
  final String status;

  Nft(this.id, this.categoryId, this.isLock, this.status);

  factory Nft.fromJson(Map<String, dynamic> json) => _$NftFromJson(json);

  Map<String, dynamic> toJson() => _$NftToJson(this);
}
