import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'passcode_state.freezed.dart';

@freezed
class PasscodeState with _$PasscodeState{
  const factory PasscodeState.initial({
        @Default(false) bool isLoading,
      }) = PasscodeStateInitial;

  const factory PasscodeState.done(String passcode) =
  createPassCodeDone;

  const factory PasscodeState.error(String msg) =
  createNewPassCodeError;

  const factory PasscodeState.valid() = checkPassCodeValid;

  const factory PasscodeState.inValid() = checkPassCodeInValid;

}