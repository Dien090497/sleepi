import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_attribute_entity/nft_attribute_entity.dart';

part 'nft_attribute_model.g.dart';

@JsonSerializable()
class NftAttributeModel {
  final int id;
  final int nftId;
  final String contractAddress;
  final int tokenId;
  final String owner;
  final String type;
  final String classNft;
  final String quality;
  final int time;
  final int level;
  final int bedMint;
  final int efficiency;
  final int luck;
  final int bonus;
  final int special;
  final int resilience;

  NftAttributeModel(
      this.id,
      this.nftId,
      this.contractAddress,
      this.tokenId,
      this.owner,
      this.type,
      this.classNft,
      this.quality,
      this.time,
      this.level,
      this.bedMint,
      this.efficiency,
      this.luck,
      this.bonus,
      this.special,
      this.resilience);

  factory NftAttributeModel.fromJson(Map<String, dynamic> json) =>
      _$NftAttributeModelFromJson(json);

  Map<String, dynamic> toJson() => _$NftAttributeModelToJson(this);

  NftAttributeEntity toEntity() => NftAttributeEntity(
      id: id,
      nftId: nftId,
      contractAddress: contractAddress,
      tokenId: tokenId,
      owner: owner,
      type: type,
      classNft: classNft,
      quality: quality,
      time: time,
      level: level,
      bedMint: bedMint,
      efficiency: efficiency,
      luck: luck,
      bonus: bonus,
      special: special,
      resilience: resilience);
}
