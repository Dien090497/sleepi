import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'wallet_navigation_state.freezed.dart';

@freezed
class WalletNavigationState with _$WalletNavigationState {
  const factory WalletNavigationState() = _WalletNavigationState;
}
