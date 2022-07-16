
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';

part 'bed_detail.g.dart';

@JsonSerializable()
class BedDetail {
  final int id;

  @JsonKey(name: 'nft_id')
  final int nftId;

  @JsonKey(name: 'nft_name')
  final String nftName;

  final String image;

  @JsonKey(name: 'contract_address')
  final String contractAddress;

  final String type;

  @JsonKey(name: 'jewel_type')
  final dynamic jewelType;

  @JsonKey(name: 'item_type')
  final dynamic itemType;

  @JsonKey(name: 'effect')
  final dynamic effect;

  @JsonKey(name: "is_mint")
  final int isMint;

  @JsonKey(name: 'class')
  final String nftClass;
  final String? quality;
  final String owner;
  final int time;
  final int level;

  @JsonKey(name: 'bed_mint')
  final int bedMint;

  final double efficiency;
  final double luck;
  final double bonus;
  final double special;
  final double resilience;

  @JsonKey(name: 'created_at')
  final String createdAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'token_id')
  final int tokenId;

  final double durability;

  @JsonKey(name: 'category_id')
  final int categoryId;

  @JsonKey(name: 'is_lock')
  final int isLock;

  final String status;

  final double? insurancePercent;

  final double? startTime;

  final double? endTime;

  int? socket;

  int? itemId;
  int? jewelSlot1;
  int? jewelSlot2;
  int? jewelSlot3;
  int? jewelSlot4;
  int? jewelSlot5;
  final Category category;

  BedDetail(this.id,
      this.nftId,
      this.nftName,
      this.image,
      this.contractAddress,
      this.type,
      this.jewelType,
      this.itemType,
      this.effect,
      this.isMint,
      this.nftClass,
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
      this.createdAt,
      this.updatedAt,
      this.tokenId,
      this.durability,
      this.categoryId,
      this.isLock,
      this.status,
      this.insurancePercent,
      this.startTime,
      this.endTime,
      this.category);

  factory BedDetail.fromJson(Map<String, dynamic> json) =>
      _$BedDetailFromJson(json);

  Map<String, dynamic> toJson() => _$BedDetailToJson(this);

  SocketEntity toSocketEntity() {
    return SocketEntity(sockets: socket,
        jewel1: jewelSlot1,
        jewel2: jewelSlot2,
        jewel3: jewelSlot3,
        jewel4: jewelSlot4,
        jewel5: jewelSlot5);
  }
}

@JsonSerializable()
class Category {
  final int id;
  final String name;

  Category({required this.id, required this.name});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}
