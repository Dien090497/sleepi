import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'market_place_model.g.dart';

@JsonSerializable()
class MarketPlaceModel {
  final int id;
  final int nftId;
  @JsonKey(name: 'category_id')
  final int categoryId;
  final int? isLock;
  final int time;
  final int level;
  final int bedMint;
  final int isMint;
  final String efficiency;
  final String luck;
  final String bonus;
  final String special;
  final String resilience;
  final String durability;
  final String? jewelType;
  final double? startTime;
  final double? endTime;
  final String price;
  final String symbol;
  final String status;
  final String createdAt;
  final String updatedAt;
  final String nftName;
  final String image;
  final String contractAddress;
  final String type;
  final String? classNft;
  final String? quality;
  final String owner;
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
    this.endTime, this.jewelType,
  );

  factory MarketPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$MarketPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPlaceModelToJson(this);

  BedEntity toBedEntity() {
    return BedEntity(
      jewelType: jewelType,
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
      durability: double.parse(durability),
      isLock: isLock ?? -1,
      bedMint: bedMint,
      efficiency: double.parse(efficiency),
      luck: double.parse(luck),
      bonus: double.parse(bonus),
      special: double.parse(special),
      resilience: double.parse(resilience),
      time: time,
      startTime: startTime,
      endTime: endTime,
      isMint: isMint,
      status: status,
      owner: owner,
      jewels: [],
      insurancePercent: 0,
      socket: null,
    );
  }

  String get infoBuff {
    switch (jewelType) {
      case 'ruby':
        return efficiency;
      case 'sapphire':
        return luck;
      case 'emerald':
        return bonus;
      case 'diamond':
        return special;
    }
    return '';
  }
}
