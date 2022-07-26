import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'nft_family.freezed.dart';

@freezed
class NftFamilyEntity with _$NftFamilyEntity {
  const factory NftFamilyEntity({
    required List<BedEntity> parent,
    required List<BedEntity> children,
  }) = _NftFamilyEntity;
}
