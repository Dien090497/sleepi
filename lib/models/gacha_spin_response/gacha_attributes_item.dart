import 'package:json_annotation/json_annotation.dart';

part 'gacha_attributes_item.g.dart';
@JsonSerializable()


class GachaAttributesItem{
  final int nftId;
  final double time;
  final double level;
  final double bedMint;
  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;
  final double tokenId;
  final double id;
  final String image;
  final String name;
  final String nftName;
  final String contractAddress;
  final String owner;
  final String type;
  final String nftType;
  final String? itemType;
  final String? jewelType;
  final String classNft;
  final String quality;
  @JsonKey(name : 'frame_colour')
  final String? frameColor;

  GachaAttributesItem({
    required this.image,
    required this.name,
    required this.nftName,
    required this.contractAddress,
    required this.owner,
    required this.type,
    required this.nftType,
    required this.itemType,
    required this.jewelType,
    required this.classNft,
    required this.quality,
    required this.level,
    required this.efficiency,
    required this.luck,
    required this.bonus,
    required this.nftId,
    required this.id,
    required this.bedMint,
    required this.time,
    required this.tokenId,
    required this.special,
    required this.resilience,
    this.frameColor

  });
  factory GachaAttributesItem.fromJson(Map<String, dynamic> json) => _$GachaAttributesItemFromJson(json);

  Map<String, dynamic> toJson() => _$GachaAttributesItemToJson(this);
}
