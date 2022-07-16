
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_detail_entity.freezed.dart';

@freezed
class NftDetailEntity with _$NftDetailEntity {

  const factory NftDetailEntity({
   required  int? id,
   required  int? categoryId,
   required  int? isLock,
   required  String? status,
   required  DateTime? createdAtt,
   required  DateTime? updatedAtt,
   required  int? nftId,
   required  String nftName,
   required  String image,
   required  String contractAddress,
   required  String type,
   required  int? isMint,
   required  int? isBurn,
   required  String class_,
   required  String quality,
   required  String? owner,
   required  int time,
   required  int level,
   required  int bedMint,
   required  double efficiency,
   required  double luck,
   required  double bonus,
   required  double special,
   required  double resilience,
   required  int tokenId,
   required  double durability,
   required  String category,
}) = _NftDetailEntity;
}
