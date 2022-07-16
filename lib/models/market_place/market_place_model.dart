import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'market_place_model.g.dart';

@JsonSerializable()
class MarketPlaceModel {
  final int id;

  @JsonKey(name: 'nft_id')
  final int nftId;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'is_lock')
  final int isLock;

  final int time;
  final int level;

  @JsonKey(name: 'bed_mint')
  final int bedMint;
  @JsonKey(name: 'is_mint')
  final int isMint;

  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;
  final double durability;
  final double startTime;
  final double endTime;
  final String price;
  final String symbol;
  final String status;
  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'nft_name')
  final String nftName;

  final String image;
  @JsonKey(name: 'contract_address')
  final String contractAddress;

  final String type;
  @JsonKey(name: 'class')
  final String? classNft;
  final String? quality;
  final String owner;
  @JsonKey(name: 'token_id')
  final int tokenId;

  MarketPlaceModel(
    this.id,
    this.nftId,
    this.categoryId,
    this.isLock,
    this.time,
    this.level,
    this.bedMint,
    this.efficiency,
    this.luck,
    this.bonus,
    this.special,
    this.resilience,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.nftName,
    this.image,
    this.contractAddress,
    this.type,
    this.quality,
    this.owner,
    this.symbol,
    this.classNft,
    this.durability,
    this.isMint,
    this.tokenId,
    this.startTime,
    this.endTime,
  );

  factory MarketPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$MarketPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPlaceModelToJson(this);

  BedEntity toBedEntity() {
    return BedEntity(
      name: nftName,
      nftId: nftId,
      nftClass: classNft ?? '',
      tokenId: tokenId,
      id: id,
      level: level,
      image: image,
      type: type,
      contractAddress: contractAddress,
      quality: quality!,
      durability: durability,
      isLock: isLock,
      bedMint: bedMint,
      efficiency: efficiency,
      luck: luck,
      bonus: bonus,
      special: special,
      resilience: resilience,
      time: time,
      startTime: startTime,
      endTime: endTime,
      isMint: isMint,
    );
  }
}
