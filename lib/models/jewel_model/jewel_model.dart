import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

part 'jewel_model.g.dart';

@JsonSerializable()
class JewelModel {
  final int id;
  final int nftId;
  final String nftName;
  final String contractAddress;
  final int tokenId;
  final String owner;
  final String type;
  final String jewelType;
  dynamic classNft;
  dynamic quality;
  final String image;
  final int time;
  final int level;
  final int bedMint;
  final int isMint;
  final int isBurn;
  final String efficiency;
  final String durability;
  final String luck;
  final String bonus;
  final String special;
  final String resilience;

  JewelModel(
    this.id,
    this.nftId,
    this.nftName,
    this.contractAddress,
    this.tokenId,
    this.owner,
    this.type,
    this.jewelType,
    this.image,
    this.time,
    this.level,
    this.bedMint,
    this.isMint,
    this.isBurn,
    this.efficiency,
    this.durability,
    this.luck,
    this.bonus,
    this.special,
    this.resilience,
  );

  factory JewelModel.fromJson(Map<String, dynamic> json) =>
      _$JewelModelFromJson(json);

  Map<String, dynamic> toJson() => _$JewelModelToJson(this);

  JewelEntity toEntity() => JewelEntity(
      special: special,
      bonus: bonus,
      type: type,
      jewelType: jewelType,
      id: id,
      image: image,
      level: level,
      nftId: nftId,
      resilience: resilience,
      efficiency: efficiency,
      luck: luck,
      quality: quality);
}
