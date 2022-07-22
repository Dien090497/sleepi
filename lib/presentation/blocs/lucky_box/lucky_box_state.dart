import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/lucky_box/lucky_box_entity.dart';

part 'lucky_box_state.freezed.dart';

@freezed
class LuckyBoxState with _$LuckyBoxState {
  const factory LuckyBoxState.loaded({
    @Default([]) List<LuckyBoxEntity> luckyBoxes,
    String? errorMessage,
  }) = _LuckyBoxState;
}
