import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/tracking_result_chart/data_x_y.dart';

part 'tracking_result_chart_data.g.dart';
@JsonSerializable()
class TrackingResultChartData {
  @JsonKey(name: 'slft_chart')
  final List<DataXY>? slftChart;
  @JsonKey(name: 'sleep_score_chart')
  final List<DataXY>? sleepScoreChart;
  @JsonKey(name: 'bed_time_chart')
  final List<DataXY>? bedTimeChart;
  @JsonKey(name: 'sleep_onset_chart')
  final List<DataXY>? sleepOnsetChart;
  @JsonKey(name: 'woke_up_chart')
  final List<DataXY>? wokeUpChart;
  @JsonKey(name: 'sleep_duration_chart')
  final List<DataXY>? sleepDurationChart;
  @JsonKey(name: 'time_in_bed_chart')
  final List<DataXY>? timeInBedChart;
  @JsonKey(name: 'noctural_awaken_chart')
  final List<DataXY>? nocturalAwakenChart;

  TrackingResultChartData({
    this.slftChart,
    this.sleepScoreChart,
    this.bedTimeChart,
    this.sleepOnsetChart,
    this.wokeUpChart,
    this.sleepDurationChart,
    this.timeInBedChart,
    this.nocturalAwakenChart,
  });

  factory TrackingResultChartData.fromJson(Map<String, dynamic> json) =>
        _$TrackingResultChartDataFromJson(json);

    Map<String, dynamic> toJson() => _$TrackingResultChartDataToJson(this);
}