
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

  int? id;
  int? userId;
  String? bedType;
  bool? alrm;
  int? startSleep;
  int? wakeUp;
  String? hashId;
  int? bedUsed;
  int? itemUsed;
  dynamic timeSleep;
  int? efficiency;
  int? luck;
  int? bonus;
  int? special;
  int? resilience;
  dynamic itemLevel;
  int? bedLevel;
  bool? enableInsurance;
  String? insurance;
  int? year;
  String? estEarn;
  dynamic actualEarn;
  dynamic timeRange;
  int? month;
  dynamic quality;
  int? day;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory TrackingModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingModelToJson(this);
}
