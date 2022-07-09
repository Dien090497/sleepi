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
    required int? efficiency,
    required int? durability,
    required int? luck,
    required int? bonus,
    required int? special,
    required int? resilience,
  }) = _NftAttributeEntity;
}
