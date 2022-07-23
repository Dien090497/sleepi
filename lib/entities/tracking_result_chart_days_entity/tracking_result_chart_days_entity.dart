import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/chart_draw_days/chart_draw_days.dart';

part 'tracking_result_chart_days_entity.freezed.dart';

@freezed
class TrackingResultChartDaysEntity with _$TrackingResultChartDaysEntity {
  const factory TrackingResultChartDaysEntity({
    required String tokenEarn,
    required String tokenEarnSymbol,
    required String scorePercent,
    required int score,
    required int betTime,
    required int onsetTime,
    required int wokeUp,
    required int timeInBed,
    required double sleepDuration,
    required int? nocturalAwaken,
    required List<ChartDrawDays> chartData,
  }) = _TrackingResultChartDaysEntity;
}