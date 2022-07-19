import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'individual_point_state.freezed.dart';

@freezed
class IndividualPointState with _$IndividualPointState {
  const factory IndividualPointState.initial({
    double? point,
    required BedEntity bed,
    required List<double> startAttributes,
    required List<double> attributesDistributed,
    required List<String> attributesNames,
    @Default(false) bool isLoading,
  }) = IndividualPointInitial;

  const factory IndividualPointState.done() = IndividualPointDone;

  const factory IndividualPointState.error(String msg) = IndividualPointError;
}
