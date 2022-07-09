import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'staking_token_info.g.dart';

@JsonSerializable()
class StakeTokenInfo {
  final int id;
  final int userId;
  final String totalStake;
  final String totalReward;
  final String mintingDiscount;
  final String levelUpDiscount;
  final String earningToken;
  final String? symbol;
  final String createdAt;
  final String updatedAt;

  StakeTokenInfo({
    required this.id,
    required this.userId,
    required this.totalStake,
    required this.totalReward,
    required this.mintingDiscount,
    required this.levelUpDiscount,
    required this.earningToken,
    required this.symbol,
    required this.createdAt,
    required this.updatedAt,
  });

  factory StakeTokenInfo.fromJson(Map<String, dynamic> json) =>
      _$StakeTokenInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StakeTokenInfoToJson(this);

}
