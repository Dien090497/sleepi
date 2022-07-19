import 'package:freezed_annotation/freezed_annotation.dart';

part 'jewel_entity.g.dart';

@JsonSerializable()
class JewelEntity {
  final int id;
  final String image;
  final int level;
  final int nftId;
  final String resilience;
  final String efficiency;
  final String luck;
  final String? quality;

  // "id": 530,
  // "nftId": 544,
  // "nftName": "Jewel #51",
  // "parent1": null,
  // "parent2": null,
  // "contractAddress": "0x263856B798C6De9fC49480b3687a7B625CAC585E",
  // "tokenId": 52,
  // "owner": "0xde2a6ae22ca55f376f4a6d92d3056e81c7d3d76c",
  // "type": "luck",
  // "jewelType": "sapphire",
  // "itemType": null,
  // "classNft": "short",
  // "quality": "common",
  // "image": "https://nft-dev.sleefi.com/v1/nft/jewels/1.svg",
  // "time": 1,
  // "level": 2,
  // "bedMint": 1,
  // "isMint": 0,
  // "isBurn": 0,
  // "efficiency": "1.00",
  // "durability": "0.00",
  // "luck": "1.00",
  // "bonus": "1.00",
  // "special": "1.00",
  // "resilience": "1.00"

  // const factory JewelEntity({
  //   required int id,
  //   required String image,
  //   required int level,
  //   required int nftID,
  //   required double luck,
  //   required String? quality,
  //   required double resilience,
  //   required double efficiency,
  //
  // }) = _JewelEntity;

  JewelEntity(
      {required this.id,
      required this.image,
      required this.level,
      required this.nftId,
      required this.resilience,
      required this.efficiency,
      required this.luck,
      required this.quality});

  factory JewelEntity.fromJson(Map<String, dynamic> json) {
    print('json is  $json}');
    return _$JewelEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$JewelEntityToJson(this);
}
