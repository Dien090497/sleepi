import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_model.g.dart';

@JsonSerializable()
class TrackingModel {
  TrackingModel({
    this.id,
    this.userId,
    this.bedType,
    this.alrm,
    this.startSleep,
    this.wakeUp,
    this.hashId,
    this.bedUsed,
    this.itemUsed,
    this.timeSleep,
    this.efficiency,
    this.luck,
    this.bonus,
    this.special,
    this.resilience,
    this.itemLevel,
    this.bedLevel,
    this.enableInsurance,
    this.insurance,
    this.year,
    this.estEarn,
    this.actualEarn,
    this.timeRange,
    this.month,
    this.quality,
    this.day,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final int? userId;
  final String? bedType;
  final bool? alrm;
  final int? startSleep;
  final int? wakeUp;
  final String? hashId;
  final int? bedUsed;
  final int? itemUsed;
  final dynamic timeSleep;
  final int? efficiency;
  final int? luck;
  final int? bonus;
  final int? special;
  final int? resilience;
  final dynamic itemLevel;
  final int? bedLevel;
  final bool? enableInsurance;
  final String? insurance;
  final int? year;
  final String? estEarn;
  final dynamic actualEarn;
  final dynamic timeRange;
  final int? month;
  final dynamic quality;
  final int? day;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory TrackingModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingModelToJson(this);
}
