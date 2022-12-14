import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'bed_model_home.g.dart';

@JsonSerializable()
class BedModelHome {
  final int id;
  final int nftId;
  final int tokenId;
  final double? percentEffect;
  final String nftName;
  final String? name;
  final String? remainTime;
  final String? levelUpTime;
  final String contractAddress;
  final String owner;
  final String type;
  final String? jewelType;
  final String? itemType;
  final String? classNft;
  final String quality;
  final String image;
  final int time;
  final int level;
  final int bedMint;
  final int isMint;
  final int isBurn;
  final double efficiency;
  final double durability;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;
  final Nft? nft;
  final ObjData? objData;

  BedModelHome(this.id,
      this.nftId,
      this.nftName,
      this.contractAddress,
      this.tokenId,
      this.owner,
      this.type,
      this.classNft,
      this.quality,
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
      this.nft,
      this.objData,
      this.jewelType,
      this.percentEffect,
      this.itemType,
      this.name,
      this.remainTime, this.levelUpTime,);

  factory BedModelHome.fromJson(Map<String, dynamic> json) =>
      _$BedModelHomeFromJson(json);

  Map<String, dynamic> toJson() => _$BedModelHomeToJson(this);

  BedEntity toEntity() =>
      BedEntity(
        levelUpTime: levelUpTime,
        remainTime: remainTime,
        percentEffect: percentEffect,
        type: type,
        itemType: itemType,
        isBurn: isBurn,
        jewelType: jewelType,
        id: id,
        nftId: nftId,
        name: name ?? nftName,
        nftClass: classNft ?? '',
        tokenId: tokenId,
        level: level,
        image: image,
        nftType: type,
        contractAddress: contractAddress,
        quality: quality,
        owner: owner,
        status: nft?.status ?? '',
        durability: durability,
        isLock: -1,
        bedMint: bedMint,
        efficiency: efficiency,
        luck: luck,
        bonus: bonus,
        special: special,
        resilience: resilience,
        time: time,
        isMint: isMint,
        socket: nft?.isLock,
        insurancePercent: objData?.insurancePercent,
        startTime: objData?.startTime,
        endTime: objData?.endTime,
        jewels: [],
        price: '',
        statusNftSale: '',
        bedBoxType: null
      );
}

@JsonSerializable()
class Nft {
  final int id;
  final int categoryId;
  final int isLock;
  final String? status;

  Nft(this.id, this.categoryId, this.isLock, this.status);

  factory Nft.fromJson(Map<String, dynamic> json) => _$NftFromJson(json);

  Map<String, dynamic> toJson() => _$NftToJson(this);
}

@JsonSerializable()
class ObjData {
  final double? insurancePercent;
  final double? startTime;
  final double? endTime;

  ObjData(this.insurancePercent, this.startTime, this.endTime);

  factory ObjData.fromJson(Map<String, dynamic> json) =>
      _$ObjDataFromJson(json);

  Map<String, dynamic> toJson() => _$ObjDataToJson(this);
}
