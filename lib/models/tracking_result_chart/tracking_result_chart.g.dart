// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_result_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingResultDaysChart _$TrackingResultDaysChartFromJson(
        Map<String, dynamic> json) =>
    TrackingResultDaysChart(
      tokenEarn: json['token_earn'] as String,
      tokenEarnSymbol: json['token_earn_symbol'] as String,
      scorePercent: json['score_percent'] as String,
      score: json['score'] as int,
      bedTime: json['bed_time'] as int,
      onsetTime: json['onset_time'] as int,
      wokeUp: json['woke_up'] as int,
      timeInBed: json['time_in_bed'] as int,
      sleepDuration: json['sleep_duration'] as int,
      nocturalAwaken: json['noctural_awaken'] as int?,
      chartData: (json['chart_data'] as List<dynamic>)
          .map((e) => ChartDrawDays.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackingResultDaysChartToJson(
        TrackingResultDaysChart instance) =>
    <String, dynamic>{
      'token_earn': instance.tokenEarn,
      'token_earn_symbol': instance.tokenEarnSymbol,
      'score_percent': instance.scorePercent,
      'score': instance.score,
      'bed_time': instance.bedTime,
      'onset_time': instance.onsetTime,
      'woke_up': instance.wokeUp,
      'time_in_bed': instance.timeInBed,
      'sleep_duration': instance.sleepDuration,
      'noctural_awaken': instance.nocturalAwaken,
      'chart_data': instance.chartData.map((e) => e.toJson()).toList(),
    };
