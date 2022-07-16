import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'individual_state.freezed.dart';

@freezed
class IndividualState with _$IndividualState {
  const factory IndividualState(
    BedEntity bed, {
    @Default(false) bool isLoading,
  }) = _IndividualState;
}
