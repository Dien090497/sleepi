import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';

part 'gacha_spin_state.freezed.dart';

@freezed
class GachaSpinState with _$GachaSpinState {
  const factory GachaSpinState.initial(
      {
        @Default(false) bool isLoading,
      }) = GachaSpinStateInitial;

  const factory GachaSpinState.done() =
  gachaSpinDone;

  const factory GachaSpinState.loading() = GachaSpinLoading;


  const factory GachaSpinState.success(GachaSpinResponse gachaSpinResponse) = GachaSpinSuccess;

  const factory GachaSpinState.fail(String msg) = GachaSpinFailed;

}
