

import 'package:freezed_annotation/freezed_annotation.dart';
part 'activation_code_state.freezed.dart';
@freezed
class ActivationCodeState with _$ActivationCodeState{

  const factory ActivationCodeState.initial() = ActivationCodeStateInit;

  const factory ActivationCodeState.error(String message) = ActivationCodeStateError;

  const factory ActivationCodeState.process() = ActivationCodeStateProcess;

  const factory ActivationCodeState.activeSuccess(String activationCode) = ActivationCodeStateActiveSuccess;


}