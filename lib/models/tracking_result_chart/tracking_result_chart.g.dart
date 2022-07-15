// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_result_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingResultChart _$TrackingResultChartFromJson(Map<String, dynamic> json) =>
    TrackingResultChart(
      tokenEarn: json['token_earn'] as String,
      tokenEarnSymbol: json['token_earn_symbol'] as String,
      scorePercent: json['score_percent'] as String,
      score: json['score'] as int,
      betTime: json['bet_time'] as int,
      onsetTime: json['onset_time'] as int,
      wokeUp: json['woke_up'] as int,
      timeInBed: json['time_in_bed'] as int,
      sleepDuration: json['sleep_duration'] as int,
      nocturalAwaken: json['noctural_awaken'] as String?,
      chartData: json['chart_data'] as List<dynamic>,
    );

Map<String, dynamic> _$TrackingResultChartToJson(
        TrackingResultChart instance) =>
    <String, dynamic>{
      'token_earn': instance.tokenEarn,
      'token_earn_symbol': instance.tokenEarnSymbol,
      'score_percent': instance.scorePercent,
      'score': instance.score,
      'bet_time': instance.betTime,
      'onset_time': instance.onsetTime,
      'woke_up': instance.wokeUp,
      'time_in_bed': instance.timeInBed,
      'sleep_duration': instance.sleepDuration,
      'noctural_awaken': instance.nocturalAwaken,
      'chart_data': instance.chartData,
    };
