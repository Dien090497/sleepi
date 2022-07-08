import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/nft_attribute_entity/nft_attribute_entity.dart';

part 'nft_entity.freezed.dart';

@freezed
class NFTEntity with _$NFTEntity {
  const factory NFTEntity({
    required int id,
    required int categoryId,
    required int isLock,
    required String status,
    required NftAttributeEntity attribute,
  }) = _NFTEntity;
}
