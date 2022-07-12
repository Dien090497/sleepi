import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_attribute_entity.freezed.dart';

@freezed
class NftAttributeEntity with _$NftAttributeEntity {
  const factory NftAttributeEntity({
    required BigInt? nftId,
    required BigInt? tokenId,
    required String? contractAddress,
    required String? owner,
    required String? type,
    required String? classNft,
    required String? quality,
    required int? time,
    required int? level,
    required int? bedMint,
    required double? efficiency,
    required double? durability,
    required double? luck,
    required double? bonus,
    required double? special,
    required double? resilience,
  }) = _NftAttributeEntity;
}
