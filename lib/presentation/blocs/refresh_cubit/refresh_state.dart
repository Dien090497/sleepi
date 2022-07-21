import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'refresh_state.freezed.dart';

@freezed
class RefreshState with _$RefreshState {
  const factory RefreshState({
    @Default(false) bool refreshHomePage,
  }) = _RefreshState;
}
