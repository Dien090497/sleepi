import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_state.freezed.dart';

@freezed
class TradeState with _$TradeState {
  const factory TradeState.initial({
    @Default(false) bool isLoading,
  }) = TradeStateInitial;

  const factory TradeState.getBalance(double balance) = swapTokenBalance;

  const factory TradeState.success() = swapTokenSuccess;

  const factory TradeState.fail(String msg) = swapTokenFail;
}
