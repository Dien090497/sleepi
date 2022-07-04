import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_entity.freezed.dart';

@freezed
class NFTEntity with _$NFTEntity {
  const factory NFTEntity({
    required String address,
    required String name,
    required String symbol,
    required BigInt balance,
  }) = _NFTEntity;
}
