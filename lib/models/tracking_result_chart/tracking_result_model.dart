
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tracking_result_model.g.dart';

@JsonSerializable()
class TrackingResultModel {

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
  String? bedNFTHoldingBonus;
  String? stakingBonus;
  String? basePointEff;
  String? insurance;
  bool enableInsurance;
  int? sleepQuality;
  int? startSleepTime;
  int? id;
  BedInfo? bed;

  factory TrackingResultModel.fromJson(Map<String, dynamic> json) =>
      _$TrackingResultModelFromJson(json);

  Map<String, dynamic> toJson() => _$TrackingResultModelToJson(this);

  TrackingResultModel(
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
      this.bedNFTHoldingBonus,
      this.stakingBonus,
      this.basePointEff,
      this.insurance,
      this.enableInsurance,
      this.sleepQuality,
      this.startSleepTime,
      this.bed,
      this.id);
}

@JsonSerializable()
class BedInfo {
  final String name;
  final String classNft;

  BedInfo(this.name, this.classNft);

  factory BedInfo.fromJson(Map<String, dynamic> json) =>
      _$BedInfoFromJson(json);

  Map<String, dynamic> toJson() => _$BedInfoToJson(this);


}
