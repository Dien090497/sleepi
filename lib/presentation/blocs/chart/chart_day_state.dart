import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_day_state.freezed.dart';

@freezed
class ChartDayState with _$ChartDayState {
  const factory ChartDayState.initial() = ChartDayInitial;

  const factory ChartDayState.loaded({
    required DateTime selectedDate,
    required DateTime firstAllowedDate,
    required DateTime lastAllowedDate,

}) = ChartDayLoaded;

  const factory ChartDayState.error(String msg) = ChartDayError;
}
