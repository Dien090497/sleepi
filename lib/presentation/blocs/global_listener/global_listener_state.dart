import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'global_listener_state.freezed.dart';

@freezed
class GlobalListenerState with _$GlobalListenerState {
  const factory GlobalListenerState.initial() = GlobalListenerInitial;

  const factory GlobalListenerState.newWalletCreated() =
      GlobalListenerNewWalletCreated;
}
