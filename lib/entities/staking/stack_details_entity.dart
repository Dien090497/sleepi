import 'package:freezed_annotation/freezed_annotation.dart';

part 'stack_details_entity.freezed.dart';

@freezed
class StackDetailsEntity with _$StackDetailsEntity {
  const factory StackDetailsEntity({
    required int userId,
    required int stackCampaignId,
    required int isLock,
    required int id,
    required String stakeToken,
    required String amount,
    required String reward,
    required String statusStacking,
    required String startTime,
    required String rewardTime,
    required String lockTime,
    required String createdAt,
    required String updatedAt,
  }) = _StackDetailsEntity;
}