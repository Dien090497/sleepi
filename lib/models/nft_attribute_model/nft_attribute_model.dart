import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/nft_attribute_entity/nft_attribute_entity.dart';

part 'nft_attribute_model.g.dart';

@JsonSerializable()
class NftAttributeModel {
  final int? nftId;
  final int? tokenId;
  final String? contractAddress;
  final String? owner;
  final String? type;
  final String? classNft;
  final String? quality;
  final int? time;
  final int? level;
  final int? bedMint;
  final int? isMint;
  final int? efficiency;
  final int? durability;
  final int? luck;
  final int? bonus;
  final int? special;
  final int? resilience;

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
      );
}
