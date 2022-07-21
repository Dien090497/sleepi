import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/draw_chart_entity/draw_chart_entity.dart';

part 'chart_day_state.freezed.dart';

@freezed
class ChartDayState with _$ChartDayState {
  const factory ChartDayState.initial() = ChartDayInitial;

  const factory ChartDayState.loaded({
    required DateTime selectedDate,
    required DateTime firstAllowedDate,
    required DateTime lastAllowedDate,
    List<DrawChartEntity>? dataChart,
    String? slftPrice,
}) = ChartDayLoaded;

  const factory ChartDayState.error(String msg) = ChartDayError;

  const factory ChartDayState.loading() = ChartDayLoading;
}
