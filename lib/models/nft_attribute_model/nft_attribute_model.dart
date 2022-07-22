import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_attribute_entity/nft_attribute_entity.dart';

part 'nft_attribute_model.g.dart';

@JsonSerializable()
class NftAttributeModel {
  final int? nftId;
  final int? tokenId;
  final String contractAddress;
  final String? owner;
  final String? type;
  final String? classNft;
  final String? quality;
  final String? image;
  final int? time;
  final int? level;
  final int? bedMint;
  final int? isMint;
  final double? efficiency;
  final double? durability;
  final double? luck;
  final double? bonus;
  final double? special;
  final double? resilience;
  final int? id;
  final String? nftName;
  final String? nftType;
  final String? jewelType;
  final String? itemType;
  final String? levelUpTime;
  final int? isBurn;
  final String? createdAt;
  final String? updatedAt;

  NftAttributeModel(
    this.nftId,
    this.contractAddress,
    this.owner,
    this.type,
    this.classNft,
    this.quality,
    this.time,
    this.level,
    this.bedMint,
    this.efficiency,
    this.durability,
    this.luck,
    this.bonus,
    this.special,
    this.resilience,
    this.tokenId,
    this.isMint,
    this.image,
    this.id,
    this.nftName,
    this.nftType,
    this.jewelType,
    this.itemType,
    this.levelUpTime,
    this.isBurn,
    this.createdAt,
    this.updatedAt,
  );

  factory NftAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$NftAttributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftAttributeModelToJson(this);

  NftAttributeEntity toEntity() => NftAttributeEntity(
        contractAddress: contractAddress,
        nftId: nftId != null ? BigInt.from(nftId!) : null,
        tokenId: tokenId != null ? BigInt.from(tokenId!) : null,
        owner: owner,
        type: type,
        classNft: classNft,
        quality: quality,
        time: time,
        level: level,
        bedMint: bedMint,
        efficiency: efficiency,
        durability: durability,
        luck: luck,
        bonus: bonus,
        special: special,
        resilience: resilience,
        name: nftName,
        image: image,
      );
}
