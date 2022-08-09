import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nft_attribute_minting.g.dart';

@JsonSerializable()
class NftAttributeMinting {
  NftAttributeMinting({
    required this.parent1,
    required this.parent2,
    required this.id,
    required this.durability,
    required this.name,
    required this.image,
    required this.nftType,
    required this.nftId,
    required this.type,
    required this.nftName,
    required this.efficiency,
    required this.jewelCorrection,
    required this.jewelType,
    required this.classNft,
    required this.quality,
    required this.itemType,
    required this.bonus,
    required this.tokenId,
    required this.bedMint,
    required this.luck,
    required this.resilience,
    required this.special,
    required this.contractAddress,
    required this.isMint,
    required this.level,
    required this.owner,
    required this.time,
  });

  final int id;
  final int parent1;
  final int parent2;
  final int durability;
  final int isMint;
  final int nftId;
  final int tokenId;
  final int level;
  final int time;
  final int bedMint;
  final int efficiency;
  final int luck;
  final int bonus;
  final int special;
  final int resilience;
  final String nftName;
  final String type;
  final String jewelType;
  final String owner;
  final String itemType;
  final String contractAddress;
  final String quality;
  final String classNft;
  final String image;
  final String nftType;
  final String? jewelCorrection;
  final String name;

  factory NftAttributeMinting.fromJson(Map<String, dynamic> json) => _$NftAttributeMintingFromJson(json);

  Map<String, dynamic> toJson() => _$NftAttributeMintingToJson(this);
}