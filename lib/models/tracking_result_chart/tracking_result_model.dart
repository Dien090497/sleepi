
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_result_model.g.dart';

@JsonSerializable()
class TrackingResultModel {
  TrackingResultModel({
    this.hashId,
    this.userId,
    this.trackingId,
    this.actualEarn,
    this.tokenEarnSymbol,
    this.nAwk,
    this.sleepOnsetTime,
    this.sleepDurationTime,
    this.wokeUpTime,
    this.bedTime,
    this.sleepQuality,
    this.startSleepTime,
    this.createdAt,
    this.updatedAt,
    this.id,
  });

  String? hashId;
  String? userId;
  int? trackingId;
  String? actualEarn;
  String? tokenEarnSymbol;
  int? nAwk;
  String? sleepOnsetTime;
  String? sleepDurationTime;
  String? wokeUpTime;
  String? bedTime;
  int? sleepQuality;
  int? startSleepTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? id;

  factory TrackingResultModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingResultModelToJson(this);
}
