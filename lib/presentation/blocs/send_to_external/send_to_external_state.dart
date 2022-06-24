import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/send_to_external/send_to_external_entity.dart';

part 'send_to_external_state.freezed.dart';

@freezed
class SendToExternalState with _$SendToExternalState {
  const factory SendToExternalState.initial(
      {
        @Default(false) bool isLoading,
      }) = sendToExternalStateInitial;

  const factory SendToExternalState.done(SendToExternalEntity entity) =
  sendToExternalDone;

  const factory SendToExternalState.loading() = SendToExternalLoading;

  const factory SendToExternalState.getSuccess(int balance) = SendToExternalGetSuccess;

  const factory SendToExternalState.calculatorFee(int fee) = SendToExternalCalculatorFee;

  const factory SendToExternalState.errorToAddress(String msg) = SendToExternalErrorToAddress;

  const factory SendToExternalState.errorValueInEther(String msg) =
  SendToExternalErrorValueInEther;
}
