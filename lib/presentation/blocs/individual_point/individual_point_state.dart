import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'individual_point_state.freezed.dart';

@freezed
class IndividualPointState with _$IndividualPointState {
  const factory IndividualPointState.initial({
    required double point,
    required List<double> startAttributes,
    required List<double> attributesChanged,
    required List<String> attributesNames,
  }) = IndividualPointInitial;

  const factory IndividualPointState.done() = IndividualPointDone;
}
