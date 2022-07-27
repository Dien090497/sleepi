import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/nft_family/nft_family.dart';

part 'individual_state.freezed.dart';

@freezed
class IndividualState with _$IndividualState {
  const factory IndividualState(
    BedEntity bed, {
    required List<double> currentPoints,
    List<BedEntity>? queryParent,
    List<BedEntity>? queryChildren,
    @Default(false) bool isRefresh,
    @Default(false) bool isLoading,
    @Default(false) bool isBase,
  }) = _IndividualState;
}
