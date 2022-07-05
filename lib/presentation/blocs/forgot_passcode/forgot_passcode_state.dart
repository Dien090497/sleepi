

import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_passcode_state.freezed.dart';
@freezed
class ForgotPasscodeState with _$ForgotPasscodeState{

  const factory ForgotPasscodeState.initial() = ForgotPasscodeStateInit;

  const factory ForgotPasscodeState.error(String message) = ForgotPasscodeStateError;

  const factory ForgotPasscodeState.process() = ForgotPasscodeStateProcess;

  const factory ForgotPasscodeState.success() = ForgotPasscodeStateSuccess;


}