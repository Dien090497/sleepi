import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/tracking_result_chart/data_x_y.dart';

part 'tracking_result_chart_data_entity.freezed.dart';

@freezed
class TrackingResultChartDataEntity with _$TrackingResultChartDataEntity {
  const factory TrackingResultChartDataEntity({
    required List<DataXY>? slftChart,
    required List<DataXY>? sleepScoreChart,
    required List<DataXY>? bedTimeChart,
    required List<DataXY>? sleepOnsetChart,
    required List<DataXY>? wokeUpChart,
    required List<DataXY>? sleepDurationChart,
    required List<DataXY>? timeInBedChart,
    required List<DataXY>? nocturalAwakenChart,
  }) = _TrackingResultChartDataEntity;
}