import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:slee_fi/entities/staking/stack_details_entity.dart';

part 'stack_details.g.dart';

@JsonSerializable()
class StackDetails {
  final int userId;
  final int stackCampaignId;
  final int isLock;
  final int id;
  final String stakeToken;
  final String amount;
  final String reward;
  final String statusStacking;
  final String startTime;
  final String rewardTime;
  final String lockTime;
  final String createdAt;
  final String updatedAt;

  StackDetails({
    required this.userId,
    required this.stackCampaignId,
    required this.isLock,
    required this.id,
    required this.stakeToken,
    required this.amount,
    required this.reward,
    required this.statusStacking,
    required this.startTime,
    required this.rewardTime,
    required this.lockTime,
    required this.createdAt,
    required this.updatedAt,
  });

factory StackDetails.fromJson(Map<String, dynamic> json) =>
      _$StackDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$StackDetailsToJson(this);

  StackDetailsEntity toEntity() => StackDetailsEntity(
        createdAt: createdAt,
        updatedAt: updatedAt,
        amount: amount,
        stackCampaignId: stackCampaignId,
        lockTime: lockTime,
        isLock: isLock,
        startTime: startTime,
        stakeToken: stakeToken,
        statusStacking: statusStacking,
        reward: reward,
        rewardTime: rewardTime,
        userId: userId,
        id: id,
      );
}
