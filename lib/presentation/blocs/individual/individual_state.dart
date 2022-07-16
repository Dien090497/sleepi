import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'individual_state.freezed.dart';

@freezed
class IndividualState with _$IndividualState {
  const factory IndividualState.initial() = IndividualInitial;
}
