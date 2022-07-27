import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/models/staking_info_response/stake_info.dart';

part 'staking_info_response.g.dart';

@JsonSerializable()
class StakingInfoResponse {
  final String tvl;
  final String apr;
  final String? aprInDay;
  final String slftPriceUsd;
  final bool isCompound;
  final StakeInfo stake;

  StakingInfoResponse({required this.tvl, required this.apr, required this.slftPriceUsd, required this.aprInDay, required this.isCompound, required this.stake});

  factory StakingInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$StakingInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StakingInfoResponseToJson(this);

}
