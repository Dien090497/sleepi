import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/presentation/blocs/send_to_external/send_to_external_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/usecase/send_to_external_usecase.dart';
import 'package:slee_fi/usecase/send_token_to_external.dart';
import 'package:slee_fi/usecase/usecase.dart';

class SendToExternalCubit extends Cubit<SendToExternalState> {
  SendToExternalCubit(): super(const SendToExternalState.initial());

  String contractAddressTo = '';
  double valueInEther = 0;
  double? fee;

  final _sendToExternalUC = getIt<SendToExternalUseCase>();
  final _sendTokenToExternalUseCase = getIt<SendTokenToExternalUseCase>();

  void init() {
    emit(const SendToExternalState.initial());
  }

  Future<void> sendToExternal(String contractAddressTo , double valueInEther, double fee) async {
    final result = await _sendToExternalUC.call(SendToExternalParams(
        contractAddressTo : contractAddressTo, valueInEther : valueInEther, fee: fee));

    result.fold((l) {
      emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
    }, (success)  {
      print(success);
      emit(const SendToExternalState.success());
    });
  }

  Future<void> getTokenBalance() async {
    final result = await _sendToExternalUC.getTokenBalance(NoParams());
    result.fold(
          (l) {
        emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
      },
          (success) {
        emit(SendToExternalState.getBalance(success));
      },
    );
  }

  Future<void> estimateGas(String contractAddressTo , {double? valueInEther}) async {
    final result = await _sendToExternalUC.calculatorFee(SendToExternalParams(
        contractAddressTo : contractAddressTo, valueInEther : valueInEther));
    result.fold(
          (l) {
        emit(SendToExternalState.fail(l is FailureMessage ? l.msg : '$l'));
      },
          (limitGas) {
            fee = ((limitGas * 50000000000) / pow(10, 18));
        emit(SendToExternalState.calculatorFee(fee));
        emit(const SendToExternalState.calculatorFeeSuccess());
          },
    );
   }

  Future<void> validator(double balance) async {
    if (contractAddressTo.isEmpty) {
      emit(const SendToExternalState.errorToAddress('Please enter contract address'));
      return;
    }
    if (isValidEthereumAddress(contractAddressTo) == false) {
      emit(const SendToExternalState.errorToAddress('Invalid address'));
      return;
    }
    if (valueInEther == 0) {
      emit(const SendToExternalState.errorValueInEther('Please enter amount'));
      return;
    }
    if (valueInEther > balance) {
      emit(const SendToExternalState.errorValueInEther('Please enter amount smaller balance'));
      return;
    }
    emit(const SendToExternalState.validatorSuccess());
    emit(const SendToExternalState.checkedValidator());
  }

  Future<void> sendTokenExternal(String toAddress, double valueInEther, SendToExternalArguments? arg) async {
    final params = SendTokenExternalParams(
        valueInEther : valueInEther, tokenEntity: arg?.tokenEntity, toAddress: toAddress);
    final result = await _sendTokenToExternalUseCase.call(params);
    result.fold((l) {
      emit(SendToExternalState.fail(l.msg));
    }, (success) {
      emit(const SendToExternalState.success());
    });
  }
}
