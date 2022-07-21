import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/models/upgrade_jewel_info_response/upgrade_info_response.dart';

part 'upgrade_jewel_state.freezed.dart';

@freezed
class JewelState with _$JewelState {
  const factory JewelState.init() = JewelStateInit;

  const factory JewelState.loaded({
    @Default([]) List<JewelEntity> jewels,
    @Default([]) List<JewelEntity> jewelsUpgrade,
    UpgradeInfoResponse? upgradeInfoResponse,
    @Default(true) bool isLoadMore,
    @Default(false) bool loading,
    @Default(false) bool upgradeSuccess,
    String? errorMessage
  }) = JewelStateLoaded;

  const factory JewelState.loadUpgraded() = JewelStateUgraded;
}
