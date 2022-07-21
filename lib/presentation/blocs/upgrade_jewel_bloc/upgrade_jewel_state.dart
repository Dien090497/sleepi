import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

part 'upgrade_jewel_state.freezed.dart';

@freezed
class JewelState with _$JewelState {
  const factory JewelState.init() = JewelStateInit;

  const factory JewelState.loaded({
    @Default([]) List<JewelEntity> jewels,
    @Default(true) bool isLoadMore,
  }) = JewelStateLoaded;

  const factory JewelState.loadUpgraded() = JewelStateUgraded;
}
