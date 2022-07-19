import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  final int id;
  final int nftId;
  final String nftName;
  final String image;
  final String contractAddress;
  final String type;
  final String? itemType;
  dynamic jewelType;
  @JsonKey(name: 'classNft')
  dynamic classBed;
  final int isMint;
  final String? quality;
  final String owner;
  final int time;
  final int level;
  // @JsonKey(name: 'bed_mint')
  final int bedMint;
  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;
  final String? effect;
  final int tokenId;
  final double durability;

  ItemModel(
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
      this.tokenId,
      this.durability,
      this.itemType,
      this.effect);

  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$ItemModelToJson(this);

  ItemEntity toEntity() {
    return ItemEntity(
      name: nftName,
      quality: quality,
      type: type,
      tokenId: tokenId,
      id: nftId,
      effect: effect ?? '',
      level: level,
      image: image,
    );
  }
}
