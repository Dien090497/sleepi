import 'package:flutter/foundation.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chart_week_state.freezed.dart';

@freezed
class ChartWeekState with _$ChartWeekState {
  const factory ChartWeekState.initial() = ChartWeekInitial;

  const factory ChartWeekState.loaded({
    required DatePeriod week,
    required DateTime firstAllowedDate,
    required DateTime lastAllowedDate,
  }) = ChartWeekLoaded;

  const factory ChartWeekState.error(String msg) = ChartWeekError;
}
