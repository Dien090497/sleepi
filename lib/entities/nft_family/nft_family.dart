import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'nft_family.freezed.dart';

@freezed
class NftFamilyEntity with _$NftFamilyEntity {
  const factory NftFamilyEntity({
    required List<FamilyDataEntity> parent,
    required List<FamilyDataEntity> children,
  }) = _NftFamilyEntity;
}

@freezed
class FamilyDataEntity with _$FamilyDataEntity {
  const factory FamilyDataEntity({
    required int id,
    required String image,
    required String type,
  }) = _FamilyDataEntity;
}
