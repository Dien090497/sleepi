import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_week_state.freezed.dart';

@freezed
class ChartWeekState with _$ChartWeekState {
  const factory ChartWeekState.initial() = ChartWeekInitial;
  const factory ChartWeekState.loaded() = ChartWeekLoaded;
  const factory ChartWeekState.error(String msg) = ChartWeekError;
}
