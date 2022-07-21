import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stake_info.g.dart';

@JsonSerializable()
class StakeInfo {
  @JsonKey(name: 'user_id')
  final int? userId;
  @JsonKey(name: 'total_stake')
  final String? totalStake;
  @JsonKey(name: 'total_reward')
  final String? totalReward;
  @JsonKey(name: 'minting_discount')
  final String? mintingDiscount;
  @JsonKey(name: 'level_up_discount')
  final String? levelUpDiscount;
  @JsonKey(name: 'earning_token')
  final String? earningToken;
  final String? symbol;

  StakeInfo({
    required this.userId,
    required this.totalStake,
    required this.totalReward,
    required this.mintingDiscount,
    required this.levelUpDiscount,
    required this.earningToken,
    required this.symbol,
  });

  factory StakeInfo.fromJson(Map<String, dynamic> json) =>
      _$StakeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StakeInfoToJson(this);

}
