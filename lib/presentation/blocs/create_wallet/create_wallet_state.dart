import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
part 'create_wallet_state.freezed.dart';

@freezed
class CreateWalletState with _$CreateWalletState{
  const factory CreateWalletState.initial(
      String passCode, {
        required String mnemonic,
        @Default(false) bool isLoading,
      }) = CreateWalletStateInitial;

  const factory CreateWalletState.done() =
  createWalletDone;

  const factory CreateWalletState.error(String msg) =
  createWalletError;
}