import 'package:json_annotation/json_annotation.dart';

part 'estimate_sleep_response.g.dart';

@JsonSerializable()
class EstimateSleepResponse {
  final TotalStats totalStats;
  final String slftTokenAmount;
  final String stakingAmountTimes;
  final String insuranceTimes;
  final int sleepScore;
  final String positiveEffect;
  final String estimateSlftEarn;
  final String durabilityReduce;

  EstimateSleepResponse(
    this.totalStats,
    this.slftTokenAmount,
    this.stakingAmountTimes,
    this.insuranceTimes,
    this.sleepScore,
    this.positiveEffect,
    this.estimateSlftEarn,
    this.durabilityReduce,
  );

  factory EstimateSleepResponse.fromJson(Map<String, dynamic> json) =>
      _$EstimateSleepResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EstimateSleepResponseToJson(this);
}

@JsonSerializable()
class TotalStats {
  final String efficiency;
  final String luck;
  final String resilience;
  final String bonus;
  final String special;

  TotalStats(
      this.efficiency, this.luck, this.resilience, this.bonus, this.special);

  factory TotalStats.fromJson(Map<String, dynamic> json) =>
      _$TotalStatsFromJson(json);

  Map<String, dynamic> toJson() => _$TotalStatsToJson(this);
}
