import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';

part 'send_to_external_state.freezed.dart';

@freezed
class SendToExternalState with _$SendToExternalState {
  const factory SendToExternalState.initial(
      {
        @Default(false) bool? isLoadBalance,
      }) = sendToExternalStateInitial;

  const factory SendToExternalState.done(SendToExternalEntity entity) =
  sendToExternalDone;

  const factory SendToExternalState.loading() = SendToExternalLoading;

  const factory SendToExternalState.getBalance({required double balance, required double fee, required double feeAvax}) = GetTokenBalanceSuccess;

  const factory SendToExternalState.success(String txHash) = sendToExternalSuccess;

  const factory SendToExternalState.fail(
      String msg,
      {@Default(false) bool isShowPopUp}) = SendToExternalFailed;

  const factory SendToExternalState.calculatorFee(double? fee) = SendToExternalCalculatorFee;

  const factory SendToExternalState.calculatorFeeSuccess() = SendToExternalCalculatorFeeSuccess;

  const factory SendToExternalState.errorToAddress(String msg) = SendToExternalErrorToAddress;

  const factory SendToExternalState.errorValueInEther(String msg) =
  SendToExternalErrorValueInEther;

  const factory SendToExternalState.checkedValidator({required double fee}) = SendToExternalCheckedValidator;

  const factory SendToExternalState.validatorSuccess() = SendToExternalValidatorSuccess;
}
