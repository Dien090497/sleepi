import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';
import 'package:slee_fi/models/upgrade_jewel_response/upgrade_jewel_response.dart';

part 'upgrade_jewel_state.freezed.dart';

@freezed
class JewelState with _$JewelState {
  const factory JewelState.init() = JewelStateInit;

  const factory JewelState.loaded({
    @Default([]) List<BedEntity> jewels,
    @Default([]) List<BedEntity> jewelsAvailable,
    @Default([]) List<BedEntity> jewelsUpgrade,
    UpgradeInfoResponse? upgradeInfoResponse,
    @Default(true) bool isLoadMore,
    @Default(true) bool isLoadMoreAvailable,
    @Default(false) bool loading,
    UpgradeJewelResponse? upgradeSuccess,
    String? errorMessage
  }) = JewelStateLoaded;

  const factory JewelState.loadUpgraded() = JewelStateUgraded;
}
