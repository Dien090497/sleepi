import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_state.dart';
import 'package:slee_fi/usecase/get_amount_out_min_usecase.dart';
import 'package:slee_fi/usecase/get_balance_token_usecase.dart';
import 'package:slee_fi/usecase/swap_token_usecase.dart';

class TradeCubit extends Cubit<TradeState> {
  TradeCubit() : super(const TradeStateInitial());

  final _swapToken = getIt<SwapTokenUseCase>();

  final _getBalanceToken = getIt<GetBalanceTokenUseCase>();
  final _getAmountOutMin = getIt<GetAmountOutMinUseCase>();

  void init() {
    emit(const TradeState.initial());
  }

  Future<void> swapToken(double value, String contractAddressFrom,
      String contractAddressTo) async {
    final result = await _swapToken.call(SwapTokenParams(
        value: value,
        contractAddressFrom: contractAddressFrom,
        contractAddressTo: contractAddressTo));

    result.fold(
      (l) {
        emit(TradeState.fail(l is FailureMessage ? l.msg : '$l'));
      },
      (success) {
        emit(const TradeState.success());
      },
    );
  }

  Future<void> getBalanceToken(String contractAddress) async {
    final result = await _getBalanceToken.call(contractAddress);
    result.fold(
      (l) {
        emit(TradeState.fail(l is FailureMessage ? l.msg : '$l'));
      },
      (success) {
        emit(TradeState.getBalance(success));
      },
    );
  }

  Future<void> getAmountOutMin(String contractAddressFrom,
      String contractAddressTo, double value) async {
    final result = await _getAmountOutMin.call(SwapTokenParams(
        value: value,
        contractAddressFrom: contractAddressFrom,
        contractAddressTo: contractAddressTo));
    result.fold(
      (l) {
        emit(TradeState.fail(l is FailureMessage ? l.msg : '$l'));
      },
      (success) {
        emit(TradeState.getAmountOutMin(success));
      },
    );
  }
}
