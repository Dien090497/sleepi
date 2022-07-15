import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';

part 'chart_month_state.freezed.dart';

@freezed
class ChartMonthState with _$ChartMonthState {
  const factory ChartMonthState.initial() = ChartMonthInitial;

  const factory ChartMonthState.loaded({
    required DateTime selectedDate,
    required DateTime firstAllowedDate,
    required DateTime lastAllowedDate,
    required List<DrawChartEntity> dataChart,
  }) = ChartMonthLoaded;

  const factory ChartMonthState.error(String msg) = ChartMonthError;
}
