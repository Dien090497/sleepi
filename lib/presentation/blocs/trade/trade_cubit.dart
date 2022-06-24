import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_state.dart';
import 'package:slee_fi/usecase/get_balance_token_usecase.dart';
import 'package:slee_fi/usecase/swap_token_usecase.dart';

class TradeCubit extends Cubit<TradeState> {
  TradeCubit() : super(const TradeStateInitial());

  final _swapToken = getIt<SwapTokenUseCase>();

  final _getBalanceToken = getIt<GetBalanceTokenUseCase>();

  void init() {
    emit(const TradeState.initial());
  }

  Future<void> swapToken(double value, String contractAddressFrom,
      String contractAddressTo) async {
    final currentState = state;
    if (currentState is TradeStateInitial) {
      final result = await _swapToken.call(SwapTokenParams(
          value: value,
          contractAddressFrom: contractAddressFrom,
          contractAddressTo: contractAddressTo));

      result.fold(
        (l) {
          emit(TradeState.fail(l is FailureMessage ? l.msg : '$l'));
          emit(currentState.copyWith(isLoading: false));
        },
        (success) {
          if (success) {
            getBalanceToken(contractAddressFrom);
            emit(const TradeState.success());
          }
        },
      );
    }
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
}
