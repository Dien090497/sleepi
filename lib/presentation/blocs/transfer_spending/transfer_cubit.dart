import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/contract_addresses/contract_addresses.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_spending_state.dart';
import 'package:slee_fi/schema/white_draw_token_schema/whit_draw_token_schema.dart';
import 'package:slee_fi/usecase/approve_usecase.dart';
import 'package:slee_fi/usecase/estimate_gas_withdraw.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/to_spending_usecase.dart';
import 'package:slee_fi/usecase/transfer_token_to_main_wallet_usecase.dart';

class TransferCubit extends Cubit<TransferSpendingState> {
  TransferCubit() : super(const TransferSpendingStateInitial());

  final _sendToExternalUC = getIt<SendToExternalUseCase>();
  final _toSpendingUseCase = getIt<ToSpendingUseCase>();
  final _approveUseCase = getIt<ApproveUseCase>();
  final _transferToMainWalletUC = getIt<TransferTokenToMainWalletUseCase>();
  final _estimateGasWithdrawUC = getIt<EstimateGasWithdrawUseCase>();

  Future<void> transferSpending(
      {required double amount,
      required String addressContract,
      required int userId}) async {
    final params = ToSpendingParams(
        amount: amount, addressContract: addressContract, userId: userId);
    final result = await _toSpendingUseCase.call(params);
    result.fold(
      (l) {
        emit(const TransferSpendingState.error(message: 'Cannot Transfer'));
      },
      (result) {
        emit(TransferSpendingState.loaded(transferSpendingEntity: result));
      },
    );
  }

  Future<void> estimateGas(String contractAddressTo,
      {double? valueInEther,
      required String amount,
      required TransferType transferType,
      required double balance,
      bool spendingToWallet = false}) async {
    emit(const TransferSpendingState.loading());
    if (amount.isEmpty) {
      emit(const TransferSpendingState.error(
          message: 'Invalid amount', typeError: 'invalid_amount'));
    } else if (double.parse(amount) > balance) {
      emit(const TransferSpendingState.error(
          message: 'Balance not enough', typeError: 'invalid_amount'));
    } else if (amount == '0') {
      emit(const TransferSpendingState.error(
          message: 'Amount input can not be zero ', typeError: 'amount_zero'));
    } else {
      if (spendingToWallet) {
        _estimateGasWithdraw(contractAddressTo, transferType.name);
        return;
      }
      _estimateGas(valueInEther);
    }
  }

  _estimateGasWithdraw(String contractAddress, String symbol) async {
    var result = await _estimateGasWithdrawUC.call(EstimateGasWithdrawParam(
        type: symbol, contractAddress: contractAddress));
    result.fold(
      (l) => emit(TransferSpendingState.error(message: l.msg)),
      (r) {
        var fee = r;
        if (fee < 0.00000000001) {
          fee = 0.0;
        }
        emit(TransferSpendingState.loaded(fee: fee));
      },
    );
  }

  _estimateGas(double? valueInEther) async {
    final result = await _sendToExternalUC.calculatorFee(SendToExternalParams(
        contractAddressTo: ContractAddresses.spending.hex,
        valueInEther: valueInEther));
    result.fold(
      (l) {
        emit(TransferSpendingState.error(message: '$l'));
      },
      (limitGas) {
        final fee = ((limitGas * 50000000000) / pow(10, 18));
        emit(TransferSpendingState.loaded(fee: fee));
      },
    );
  }

  Future<void> approve(
      {required double amount, required String addressContract}) async {
    final params = ToSpendingParams(
        amount: amount, addressContract: addressContract, userId: 0);
    final result = await _approveUseCase.call(params);
    result.fold(
      (l) {
        emit(TransferSpendingState.error(message: '$l'));
      },
      (result) {
        emit(const TransferSpendingState.loaded());
      },
    );
  }

  void transferToMainWallet(
      String amount, String symbol, String address) async {
    emit(const TransferSpendingState.loading());
    final result = await _transferToMainWalletUC
        .call(WhitDrawTokenSchema(symbol, address, amount));
    result.fold(
      (l) => emit(TransferSpendingState.error(message: l.msg)),
      (r) => emit(const TransferSpendingState.toWalletSuccess()),
    );
  }
}
