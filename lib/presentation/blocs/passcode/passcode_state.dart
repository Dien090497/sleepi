import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
part 'passcode_state.freezed.dart';

@freezed
class PasscodeState with _$PasscodeState{
  const factory PasscodeState.initial(
      String passCode, {
        required String mnemonic,
        @Default(false) bool isLoading,
      }) = PasscodeStateInitial;

  const factory PasscodeState.done(WalletInfoEntity wallet) =
  createPassCodeDone;

  const factory PasscodeState.error(String msg) =
  createNewPassCodeError;
}