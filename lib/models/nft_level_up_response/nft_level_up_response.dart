import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'nft_level_up_response.g.dart';

@JsonSerializable()
class NftLevelUp {
  final double? cost;
  final double? costSpeedUp;
  @JsonKey(name: 'require_time')
  final int? requireTime;
  @JsonKey(name: 'sleep_time')
  final int? sleepTime;

  NftLevelUp({
    this.cost,
    this.costSpeedUp,
    this.requireTime,
    this.sleepTime,
  });

  factory NftLevelUp.fromJson(Map<String, dynamic> json) =>
      _$NftLevelUpFromJson(json);

  Map<String, dynamic> toJson() => _$NftLevelUpToJson(this);

}

