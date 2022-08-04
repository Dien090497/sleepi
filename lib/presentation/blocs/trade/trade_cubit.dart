import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/trade/trade_state.dart';
import 'package:slee_fi/usecase/approve_trade_token_usecase.dart';
import 'package:slee_fi/usecase/check_allowance_usecase.dart';
import 'package:slee_fi/usecase/get_amount_out_min_usecase.dart';
import 'package:slee_fi/usecase/get_balance_token_usecase.dart';
import 'package:slee_fi/usecase/get_list_token_usecase.dart';
import 'package:slee_fi/usecase/swap_token_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class TradeCubit extends Cubit<TradeState> {
  TradeCubit()
      : super(TradeStateInitial(
            listTokens: getIt<List<dynamic>>(instanceName: 'tokens')));

  final _swapToken = getIt<SwapTokenUseCase>();
  final _approveToken = getIt<ApproveTradeTokenUseCase>();
  final _checkAllowance = getIt<CheckAllowanceUseCase>();
  final _getBalanceToken = getIt<GetBalanceTokenUseCase>();
  final _getAmountOutMin = getIt<GetAmountOutMinUseCase>();

  Future<void> init() async {
    await getIt<GetListTokenUseCase>().call(NoParams()).then((value) => {
          value.fold((l) {
            emit(TradeState.initial(
                listTokens: getIt<List<dynamic>>(instanceName: 'tokens'),
                isLoading: true));
          }, (r) {
            emit(TradeState.initial(listTokens: r, isLoading: true));
          })
        });
  }

  Future<void> swapToken(double value, String contractAddressFrom,
      String contractAddressTo) async {
    emit(const TradeState.loading());
    await _swapToken
        .call(SwapTokenParams(
            value: value,
            contractAddressFrom: contractAddressFrom,
            contractAddressTo: contractAddressTo))
        .then((value) {
      value.fold(
        (l) {
          emit(TradeState.fail('$l'));
        },
        (r) {
          if (r == '') {
            emit(const TradeState.success());
          } else {
            emit(TradeState.fail(r));
          }
        },
      );
    });
  }

  Future<void> approveToken(String contractAddress) async {
    emit(const TradeState.loading());
    final result = await _approveToken.call(contractAddress);
    Future.delayed(const Duration(milliseconds: 1000), () {
      result.fold(
        (l) {
          emit(TradeState.fail('$l'));
        },
        (txh) {
          emit(TradeState.approveSuccess(txh));
        },
      );
    });
  }

  Future<void> checkApproveToken(double value, String contractAddress) async {
    final result = await _checkAllowance.call(CheckApproveTokenParams(
        value: value, contractAddress: contractAddress));
    result.fold(
      (l) {
        emit(TradeState.fail('$l'));
      },
      (success) {
        emit(TradeState.allowance(success));
      },
    );
  }

  Future<void> getBalanceToken(String contractAddress) async {
    emit(const TradeState.loading());
    final result = await _getBalanceToken.call(contractAddress);
    result.fold(
      (l) {
        emit(TradeState.fail('$l'));
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
        emit(TradeState.fail('$l'));
      },
      (success) {
        emit(TradeState.getAmountOutMin(success));
      },
    );
  }
}
