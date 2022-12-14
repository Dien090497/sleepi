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
  @JsonKey(name: 'is_lock')
  final int? isLock;
  final double? percentEffect;
  final int? isBurn;
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
  final String? itemType;
  final double? startTime;
  final double? endTime;
  final String? remainTime;
  final String? levelUpTime;
  final String price;
  final String symbol;
  final String? status;
  final String? jewelCorrection;
  final String createdAt;
  final String updatedAt;
  final String nftName;
  final String name;
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
    this.name,
    this.image,
    this.contractAddress,
    this.type,
    this.quality,
    this.owner,
    this.symbol,
    this.classNft,
    this.durability,
    this.jewelCorrection,
    this.isMint,
    this.tokenId,
    this.startTime,
    this.endTime,
    this.jewelType,
    this.isBurn,
    this.percentEffect,
    this.itemType,
    this.remainTime, this.levelUpTime,
  );

  factory MarketPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$MarketPlaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$MarketPlaceModelToJson(this);

  BedEntity toBedEntity() {
    return BedEntity(
      levelUpTime: levelUpTime,
      remainTime: remainTime,
      itemType: itemType,
      type: type,
      percentEffect: percentEffect ??
          (jewelCorrection != null ? double.parse(jewelCorrection!) : 0.0),
      jewelType: jewelType,
      isBurn: isBurn ?? 0,
      name: name,
      nftId: nftId,
      nftClass: classNft ?? '',
      tokenId: tokenId,
      id: id,
      level: level,
      image: image,
      nftType: type,
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
      status: status ?? '',
      owner: owner,
      jewels: [],
      insurancePercent: 0,
      socket: null,
      statusNftSale: '',
      price: price,
      bedBoxType: null
    );
  }

  // String get infoBuff {
  //   switch (jewelType) {
  //     case 'ruby':
  //       return efficiency;
  //     case 'sapphire':
  //       return luck;
  //     case 'emerald':
  //       return bonus;
  //     case 'diamond':
  //       return special;
  //   }
  //   return '';
  // }
}
