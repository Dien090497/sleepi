import 'package:freezed_annotation/freezed_annotation.dart';

part 'trade_state.freezed.dart';

@freezed
class TradeState with _$TradeState {
  const factory TradeState.initial({
    @Default(false) bool isLoading,
    required List<dynamic> listTokens,
  }) = TradeStateInitial;

  const factory TradeState.loading() = swapLoading;

  const factory TradeState.getBalance(double balance) = swapTokenBalance;

  const factory TradeState.getAmountOutMin(double amountOutMin) = tradeGetAmountOutMin;

  const factory TradeState.success() = swapTokenSuccess;

  const factory TradeState.allowance(bool approve) = swapTokenAllowance;

  const factory TradeState.approveSuccess(String txh) = approveTokenSuccess;

  const factory TradeState.fail(String msg) = swapTokenFail;

}
