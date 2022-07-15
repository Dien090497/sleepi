import 'package:json_annotation/json_annotation.dart';

part 'tracking_result_chart.g.dart';
@JsonSerializable()
class TrackingResultChart {
  @JsonKey(name: 'token_earn')
  final String tokenEarn;
  @JsonKey(name: 'token_earn_symbol')
  final String tokenEarnSymbol;
  @JsonKey(name: 'score_percent')
  final String scorePercent;
  final int score;
  @JsonKey(name: 'bet_time')
  final int betTime;
  @JsonKey(name: 'onset_time')
  final int onsetTime;
  @JsonKey(name: 'woke_up')
  final int wokeUp;
  @JsonKey(name: 'time_in_bed')
  final int timeInBed;
  @JsonKey(name: 'sleep_duration')
  final int sleepDuration;
  @JsonKey(name: 'noctural_awaken')
  final String? nocturalAwaken;
  @JsonKey(name: 'chart_data')
  final List<dynamic> chartData;

  TrackingResultChart({
    required this.tokenEarn,
    required this.tokenEarnSymbol,
    required this.scorePercent,
    required this.score,
    required this.betTime,
    required this.onsetTime,
    required this.wokeUp,
    required this.timeInBed,
    required this.sleepDuration,
    this.nocturalAwaken,
    required this.chartData,
  });

  factory TrackingResultChart.fromJson(Map<String, dynamic> json) =>
      _$TrackingResultChartFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingResultChartToJson(this);
}