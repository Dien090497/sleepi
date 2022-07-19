import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'bed_model_home.g.dart';

@JsonSerializable()
class BedModelHome {
  final int id;
  final int nftId;
  final String nftName;
  dynamic parent1;
  dynamic parent2;
  final String contractAddress;
  final int tokenId;
  final String owner;
  final String type;
  dynamic jewelType;
  dynamic itemType;
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
  final Nft nft;
  final ObjData objData;

  BedModelHome(
    this.id,
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
  );

  factory BedModelHome.fromJson(Map<String, dynamic> json) =>
      _$BedModelHomeFromJson(json);

  Map<String, dynamic> toJson() => _$BedModelHomeToJson(this);

  BedEntity toEntity() => BedEntity(
      id: id,
      nftId: nftId,
      name: nftName,
      nftClass: '',
      tokenId: tokenId,
      level: level,
      image: image,
      type: type,
      contractAddress: contractAddress,
      quality: quality,
      owner: owner,
      status: nft.status,
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
      socket: 0,
      insurancePercent: objData.insurancePercent,
      startTime: objData.startTime,
      endTime: objData.endTime,
      jewels: []);
}

@JsonSerializable()
class Nft {
  final int id;
  final int categoryId;
  final int isLock;
  final String status;

  Nft(this.id, this.categoryId, this.isLock, this.status);

  factory Nft.fromJson(Map<String, dynamic> json) => _$NftFromJson(json);

  Map<String, dynamic> toJson() => _$NftToJson(this);
}

@JsonSerializable()
class ObjData {
  final double insurancePercent;
  final double startTime;
  final double endTime;

  ObjData(this.insurancePercent, this.startTime, this.endTime);

  factory ObjData.fromJson(Map<String, dynamic> json) =>
      _$ObjDataFromJson(json);

  Map<String, dynamic> toJson() => _$ObjDataToJson(this);
}
