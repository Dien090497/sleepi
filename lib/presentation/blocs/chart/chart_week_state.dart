import 'package:flutter/foundation.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_chart_data.dart';

part 'chart_week_state.freezed.dart';

@freezed
class ChartWeekState with _$ChartWeekState {
  const factory ChartWeekState.initial() = ChartWeekInitial;

  const factory ChartWeekState.loaded({
    required DatePeriod week,
    required DateTime firstAllowedDate,
    required DateTime lastAllowedDate,
    required TrackingResultChartData dataChart,
  }) = ChartWeekLoaded;

  const factory ChartWeekState.error(String msg) = ChartWeekError;
}
