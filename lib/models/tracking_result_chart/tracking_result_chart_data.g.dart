// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tracking_result_chart_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackingResultChartData _$TrackingResultChartDataFromJson(
        Map<String, dynamic> json) =>
    TrackingResultChartData(
      slftChart: (json['slft_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      sleepScoreChart: (json['sleep_score_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      bedTimeChart: (json['bed_time_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      sleepOnsetChart: (json['sleep_onset_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      wokeUpChart: (json['woke_up_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      sleepDurationChart: (json['sleep_duration_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeInBedChart: (json['time_in_bed_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
      nocturalAwakenChart: (json['noctural_awaken_chart'] as List<dynamic>?)
          ?.map((e) => DataXY.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackingResultChartDataToJson(
        TrackingResultChartData instance) =>
    <String, dynamic>{
      'slft_chart': instance.slftChart?.map((e) => e.toJson()).toList(),
      'sleep_score_chart':
          instance.sleepScoreChart?.map((e) => e.toJson()).toList(),
      'bed_time_chart': instance.bedTimeChart?.map((e) => e.toJson()).toList(),
      'sleep_onset_chart':
          instance.sleepOnsetChart?.map((e) => e.toJson()).toList(),
      'woke_up_chart': instance.wokeUpChart?.map((e) => e.toJson()).toList(),
      'sleep_duration_chart':
          instance.sleepDurationChart?.map((e) => e.toJson()).toList(),
      'time_in_bed_chart':
          instance.timeInBedChart?.map((e) => e.toJson()).toList(),
      'noctural_awaken_chart':
          instance.nocturalAwakenChart?.map((e) => e.toJson()).toList(),
    };
