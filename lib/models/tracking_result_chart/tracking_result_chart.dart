import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/tracking_result_chart_days_entity/tracking_result_chart_days_entity.dart';
import 'package:slee_fi/models/chart_draw_days/chart_draw_days.dart';

part 'tracking_result_chart.g.dart';

@JsonSerializable()
class TrackingResultDaysChart {
  @JsonKey(name: 'token_earn')
  final String tokenEarn;
  @JsonKey(name: 'token_earn_symbol')
  final String tokenEarnSymbol;
  @JsonKey(name: 'score_percent')
  final String scorePercent;
  final int score;
  @JsonKey(name: 'bed_time')
  final int bedTime;
  @JsonKey(name: 'onset_time')
  final int onsetTime;
  @JsonKey(name: 'woke_up')
  final int wokeUp;
  @JsonKey(name: 'time_in_bed')
  final int timeInBed;
  @JsonKey(name: 'sleep_duration')
  final int sleepDuration;
  @JsonKey(name: 'noctural_awaken')
  final int? nocturalAwaken;
  @JsonKey(name: 'chart_data')
  final List<ChartDrawDays> chartData;

  TrackingResultDaysChart({
    required this.tokenEarn,
    required this.tokenEarnSymbol,
    required this.scorePercent,
    required this.score,
    required this.bedTime,
    required this.onsetTime,
    required this.wokeUp,
    required this.timeInBed,
    required this.sleepDuration,
    this.nocturalAwaken,
    required this.chartData,
  });

  factory TrackingResultDaysChart.fromJson(Map<String, dynamic> json) =>
      _$TrackingResultDaysChartFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingResultDaysChartToJson(this);

  TrackingResultChartDaysEntity toEntity() => TrackingResultChartDaysEntity(
        sleepDuration: sleepDuration,
        wokeUp: wokeUp,
        onsetTime: onsetTime,
        betTime: bedTime,
        timeInBed: timeInBed,
        chartData: chartData,
        tokenEarn: tokenEarn,
        tokenEarnSymbol: tokenEarn,
        scorePercent: scorePercent,
        score: score,
        nocturalAwaken: nocturalAwaken,
      );
}
