import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_month_state.freezed.dart';

@freezed
class ChartMonthState with _$ChartMonthState {
  const factory ChartMonthState.initial() = ChartMonthInitial;

  const factory ChartMonthState.loaded({
    required DateTime selectedDate,
    required DateTime firstAllowedDate,
    required DateTime lastAllowedDate,
  }) = ChartMonthLoaded;

  const factory ChartMonthState.error(String msg) = ChartMonthError;
}
