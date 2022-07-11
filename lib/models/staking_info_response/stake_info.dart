import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stake_info.g.dart';

@JsonSerializable()
class StakeInfo {
  final int? id;
  final int? userId;
  final String? totalStake;
  final String? totalReward;
  final String? mintingDiscount;
  final String? levelUpDiscount;
  final String? earningToken;
  final String? symbol;
  final String? createdAt;
  final String? updatedAt;

  StakeInfo({
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

  factory StakeInfo.fromJson(Map<String, dynamic> json) =>
      _$StakeInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StakeInfoToJson(this);

}
