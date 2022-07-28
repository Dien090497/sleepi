import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'passcode_state.freezed.dart';

@freezed
class PasscodeState with _$PasscodeState {
  const factory PasscodeState.initial() = PasscodeInitial;

  const factory PasscodeState.loading() = PasscodeLoading;

  const factory PasscodeState.done(String passcode) = PasscodeDone;

  const factory PasscodeState.error(String msg) = PasscodeError;

  const factory PasscodeState.valid() = PasscodeValid;
}
