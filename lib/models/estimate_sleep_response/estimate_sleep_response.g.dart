// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'estimate_sleep_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EstimateSleepResponse _$EstimateSleepResponseFromJson(
        Map<String, dynamic> json) =>
    EstimateSleepResponse(
      (json['todayEarn'] as num).toDouble(),
      (json['maxEarnPerDay'] as num).toDouble(),
    );

Map<String, dynamic> _$EstimateSleepResponseToJson(
        EstimateSleepResponse instance) =>
    <String, dynamic>{
      'todayEarn': instance.todayEarn,
      'maxEarnPerDay': instance.maxEarnPerDay,
    };
